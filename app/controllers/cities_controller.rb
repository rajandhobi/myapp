class CitiesController < ApplicationController
require "csv"
layout "cities" 
before_action :authenticate_user!


def index
@cities = City.all 

# // for loading fast
@cities = City.with_attached_logo
              .with_attached_images
              .with_attached_video_tour
              .order(:id)
              .page(params[:page])
              .per(5)

authorize @cities
@q = City.ransack(params[:q])
@cities = @q.result(distinct: true)
              .order(:id)
              .page(params[:page])
              .per(5)
              
  # respond_to do |format|
  #   format.html
  #   format.csv { send_data cities_to_csv(@q.result), filename: "cities.csv" }
  # end
end

  def show
  @city = City.find(params[:id])
  authorize @city

  if params[:page].present?
    session[:last_page] = params[:page]
  elsif request.referer&.include?("page=")
    session[:last_page] = CGI.parse(URI.parse(request.referer).query)["page"]&.first
  else
    session[:last_page] = 1
  end
end

  def new
    @city = City.new
    authorize @city
2.times { @city.places.build }
# render layout: false if turbo_frame_request? 
 end
  
  def create
  @city = City.new(city_params)
  authorize @city

  # if @city.save
  #   render json: @city,
  #          status: :created,
  #          location: city_url(@city)
  # else
  #   render json: @city.errors,
  #          status: :unprocessable_entity
  # end

respond_to do |format|
  if @city.save 
    format.html { redirect_to cities_path, notice: "City created"}
   format.json { render json: @city, status: :created}
  else 
    format.json { render json: @city.errors, status: :unprocessable_entity}
    format.html { render :new, status: :unprocessable_entity }
  end 
  end
end

  def edit
    @city = City.find(params[:id])
    authorize @city
  end

  def update
    @city = City.find(params[:id])
    authorize @city
    
if params[:city] && params[:city][:logo].present?
    @city.logo.attach(params[:city][:logo])
  end

#  if params[:city][:images].present?
#   end

if @city.update(city_params)
respond_to do |format|
  format.json {
gallery_html = if @city.images.attached? 
                         @city.images.map { |img| 
                           src = img.representable? ? url_for(img.representation(resize_to_limit: [100, 100])) : ""
                           "<div class='position-relative'><img src='#{src}' class='rounded border shadow-sm' style='width: 60px; height: 60px; object-fit: cover;'></div>" 
                         }.join 
                       else 
                         "<small class='text-muted'>No gallery images</small>"
                       end

 render json: { id: @city.id, name: @city.name, country: @city.country, logo_url: @city.logo.attached? ? url_for(@city.logo.variant(resize_to_limit: [100, 100])) : nil,
          video_url: @city.video_tour.attached? ? url_for(@city.video_tour) : nil,
          gallery_html: gallery_html 
        },
           status: :ok 
          }
  
  format.html {
  q_params = params[:q].present? ? params[:q].to_unsafe_h : {}

 if q_params["country_cont"].present?
      q_params["country_cont"] = @city.country
    end

    if q_params["name_cont"].present?
      q_params["name_cont"] = @city.name
    end

 redirect_to cities_path(page: params[:page], q: q_params, anchor: "city_#{@city.id}"), 
 notice: "City updated successfully!" 
  }
end
  else
respond_to do |format|
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @city.errors, status: :unprocessable_entity }
    end
  end 
  end


# // Authrnticated Controller for logo image

def download_logo
  @city = City.find(params[:id])
  authorize @city

if @city.logo.attached?
  variation = @city.logo.variant(:thumb)
  redirect_to url_for(variation)
else
    head :not_found
  end
end

# /------------------------------------/
  # attached file pdf controller 

def attach_kit 
  @city = City.find(params[:id])
  authorize @city
  file_path = Rails.root.join("public", "attachments", "welcome.pdf")
  if File.exist?(file_path)
    file = File.open(file_path)
    @city.images.attach( 
      io: file, 
      filename: "welcome_#{@city.name}.pdf",
      content_type: "application/pdf",
      identify: false
    )
    redirect_to cities_path, notice: "PDF attached Successfully!!!"
  else
    redirect_to cities_path, alert: "File not found in public/attachments folder!"
  end
end
# /-----------------------------/


def set_city
  @city = City.find(params[:id])
end


#  Downloading file shown Binary data controller 
def check_file_data
  @city = City.find(params[:id])
  if @city.logo.attached?
    binary_data = @city.logo.download 
puts "file memory size: #{binary_data.size} bytes"

if @city.logo.open do |temp_file|
  puts "this path to the file #{temp_file.path}"
end 
end
end
end
# /-----------------------------/

def delete_image_attachment
  @city = City.find(params[:id])
  image = @city.images.find(params[:image_id])
if image
    image.purge 
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("image_container_#{params[:image_id]}") }
      format.json { head :no_content }
      format.html { redirect_back fallback_location: cities_path, notice: "Image deleted." }
    end
  end
end

 def unknown
    render json: params[:other]
 end

 def pages 
   render json: "Pages: #{params[:pages]} | format Required: #{params[:format]}"
 end  

 def area 
   render json: "Area: #{params[:area]} | Nmae: #{paramas[:name]}"
 end
  
 def foo 
   render plain: "foo : #{params[:a]} | And #{params[:b]}"
 end

  def destroy
    @city = City.find(params[:id])
    authorize @city
    @city.destroy
respond_to do |format|
   format.json { head :no_content }
    format.html { redirect_to cities_path(page: params[:page], q: params[:q]&.to_unsafe_h), 
      notice: "City was successfully deleted."
    }
  end  
end

  private
  
def cities_to_csv(cities)
  CSV.generate(headers: true) do |csv|
    csv << ["ID", "Name", "Country", "Created At", "Updated At"]

    @cities.each do |city|
      csv << [city.id, city.name, city.country, city.created_at, city.updated_at]
    end
  end
end

def city_params
  params.require(:city)
        .permit(  
          :name,
          :country,
          :logo,
          :video_tour,
          images: [],
          places_attributes: [:id, :name, :category, :_destroy]
        )
end
end



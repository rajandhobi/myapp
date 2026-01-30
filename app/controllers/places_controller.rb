class PlacesController < ApplicationController
  require "csv"

  def index 
    if params[:query].present?
      @places = Place.where("name LIKE ?", "%#{params[:query]}%")
    else
      @places = Place.all
    end
  end

  # For params practice


def debug_params
  render plain: params.inspect
end


def show 
  @place = Place.find(params[:id])
  # render plain: "places id #{params[:id]}"
end

  def new
    @place = Place.new(visited_on: Date.new(2023, 5, 10))
  end

  

  # def upload
  #   uploaded_file = params[:csv_file]

  #   if uploaded_file.present?
  #     csv_data = CSV.parse(uploaded_file.read, headers: true)

  #     csv_data.each do |row|
  #       city = City.find_or_create_by(name: row["city"])

  #       Place.create(
  #         name: row["name"],
  #         category: row["category"],
  #         city: city
  #       )
  #     end

  #     redirect_to places_path, notice: "CSV uploaded successfully!"
  #   else
  #     redirect_to places_path, alert: "Please upload a file"
  #   end
  # end

  private

  def place_params
    params.require(:place).permit(
      :name, :category, :city_id, :city, :visited_on, :time_zone,
      phone_numbers: [],
      addresses: [:line1, :city]
    )
  end
end
            
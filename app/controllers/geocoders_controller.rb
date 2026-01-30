class GeocodersController < ApplicationController
  before_action :set_geocoder

  def show
  end

  def new
    @geocoder = Geocoder.create
  end

  def create
    if @geocoder.create(geocoder_params)
      redirect_to geocoder_path, notice: "Created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @geocoder.update(geocoder_params)
      redirect_to geocoder_path, notice: "Updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @geocoder.destroy
    redirect_to new_geocoder_path, notice: "Deleted"
  end

  private

  def set_geocoder
    @geocoder = Geocoder.first_or_initialize
  end

  def geocoder_params
    params.require(:geocoder).permit(:latitude, :longitude)
  end
end

class CountryController < ApplicationController
  def index
    @countries = Country.all

    # @markers = @countries.map do |country|
    #   {
    #     lng: country.longitude,
    #     lat: country.latitude
    #   }
    # end
  end

  def show
    @country = Country.find(params[:id])
  end

end


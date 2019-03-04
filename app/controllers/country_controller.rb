class CountryController < ApplicationController
  def index
    @countries = Country.all
     @markers = @countries.map do |country|
      {
        lng: country.longitude,
        lat: country.latitude
      }
    end
  end

  def show
    @my_visited_places = []
    @my_planned_places = []
    @countries = Country.all
    @country = Country.find(params[:id])
    @my_visited_places << @country if @country.visited?
    @my_planned_places << country if @country.planned?
  end

  def update
    @country = Country.find(params[:id])
    @country.update(country_params)
  end

  def country_params
    params.require(:country).permit(:visited, :planned, user_id: current_user)
  end
end

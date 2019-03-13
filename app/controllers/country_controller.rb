class CountryController < ApplicationController
  def index
    @countries = Country.all
    @markers = @countries.map do |country|
      {
        lng: country.longitude,
        lat: country.latitude,
        infoWindow: { content: render_to_string(partial: "/shared/map_window", locals: { country: country }) }
      }
    end
    @my_visited_places = []
    @my_planned_places = []
    @countries.each do |country|
      @my_visited_places << country if country.visited? && country.user == current_user
      @my_planned_places << country if country.planned? && country.user == current_user
    end
  end

  def show
    @country = Country.find(params[:id])
  end

  def update
    @country = Country.find(params[:id])
    if @country.update(country_params)
      redirect_to @country
    end
  end

  def country_params
    params.require(:country).permit(:visited, :planned, user_id: current_user)
  end
end

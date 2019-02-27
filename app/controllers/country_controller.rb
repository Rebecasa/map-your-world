class CountryController < ApplicationController
  def index
    @countries = Country.all
  end

  def show
    @country = Country.find(params[:id])
  end

  def update
    @country = Country.find(params[:id])
    @country.update(country_params)
  end

  def country_params
    params.require(:country).permit(:visited, :planned)
  end
end

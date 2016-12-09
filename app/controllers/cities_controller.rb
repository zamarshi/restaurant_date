class CitiesController < ApplicationController

  def index
    @cities = City.order(created_at: DESC)
  end

  def show
    @city = current_city
    @cuisines = current_city.cuisines
  end

end

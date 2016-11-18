class SettingsController < ApplicationController

  def index
    @city = current_user.city
    @restaurant = current_user.restauran
    @cuisine = current_user.cuisine
    @age = current_user.age
    @sex = current_user.sex
    
  end



end

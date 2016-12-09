class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    city = current_user.city
    cuisine = current_user.cuisine
    @users = User.where(cuisine: cuisine, city: city)
    respond_to do |format|
      format.html { render }
      format.text { render }
      format.xml  { render xml: @users }
      format.json { render json: @users.to_json }
    end

  end

  def like
    bool = User.find(params[:id]).following?(current_user)
    respond_to do |format|
      format.html { render }
      format.json { render json: bool.to_json }
    end
  end



  def create
    user_params = params.require(:user).permit([:first_name,
                                                :last_name,
                                                :email,
                                                :password,
                                                :password_confirmation])
    @user = User.new user_params
    @user.city = City.find(2)
    @user.cuisine = Cuisine.find(2)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Thank you for signing up'
    else
      render :new
    end
  end
end

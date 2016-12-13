class UsersController < ApplicationController
  before_action :authenticate_user


  def new
    @user = User.new
  end

  def index
    city = current_user.city
    cuisine = current_user.cuisine
    @users = User.where.not(id:current_user.id).where.not(id: current_user.viewed_users.map(&:id)).where(cuisine: cuisine, city: city)
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

  def current_user_id
    user_id = current_user.id
    respond_to do |format|
      format.html { render }
      format.json { render json: user_id.to_json }
    end
  end

  def match
    @matches = current_user.matches
    respond_to do |format|
      format.html { render }
      format.json { render json: @matches.to_json }
    end
  end

  # def update
  #     @user = current_user
  #     if @user.update_attributes(location: "The Dude", email: "dude@abides.org")
  #
  #     else
  #       render 'edit'
  #     end
  # end


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

class ApplicationController < ActionController::Base
protect_from_forgery with: :null_session, if: Proc.new {|c| c.request.format == 'application/json'}

include Knock::Authenticable

  def current_city
    @current_city = current_user.city
  end
  helper_method :current_city



  def user_signed_in?
      session[:user_id].present?
  end
    helper_method :user_signed_in?

    helper_method :current_user

end

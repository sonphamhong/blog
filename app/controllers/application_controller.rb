class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionHelper

  def authenticate_user!
    unless logged_in?
      store_location(request.url)
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def logged_in_user
    if logged_in?
      redirect_to root_url
    end
  end
end

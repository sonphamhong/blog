class SessionController < ApplicationController

  before_action :logged_in_user, only: [:new, :create]
  def new
    store_location(request.referer) if session[:forwarding_url].nil?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        log_in user
        redirect_to_back_or(user)
      else
        flash[:info] = "Please check your email to activate your account."
        redirect_to user
      end
    else
      flash.now[:danger] = "Wrong Email or password"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private
    def logged_in_user
      if logged_in?
        redirect_to root_url
      end
    end
end

class SessionController < ApplicationController

  before_action :logged_in_user, only: [:new, :create]
  def new
    
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "Wrong Email or password"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end

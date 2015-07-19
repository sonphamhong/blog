class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      log_in @user
      redirect_to @user
    else
      # binding.pry
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(params_user)
      redirect_to root_url
    else
      render "edit"
    end
  end

  private
    def params_user
      params.require(:user).permit(:email, :name, :password, :password_confirm)
      
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def corrent_user
      user = User.find_by(id: params[:id])
      redirect_to root_url unless current_user?(user)
    end
end

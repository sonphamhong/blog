class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :show]
  before_action :correct_user,   only: [:edit, :update]
  before_action :logged_in_user, only: [:new]
  layout "account", only: [:show] 
  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = "Please check your email to activate your account."
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = current_user

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

  def like
    @post = Post.find(params[:post_id])
    current_user.like(@post)
  end

  def unlike
    @post = Post.find(params[:post_id])
    current_user.unlike(@post)
  end

  private
    def params_user
      params.require(:user).permit(:email, :name, :password, :password_confirm)
      
    end

    def correct_user
      user = User.find_by(id: params[:id])
      redirect_to root_url unless current_user?(user)
    end
end

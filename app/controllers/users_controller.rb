class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to @user
    else
      # binding.pry
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def params_user
      params.require(:user).permit(:email, :name, :password, :password_confirm)
      
    end
end

class PasswordResetController < ApplicationController
  def new
  end

  def edit
    user = User.find_by(email: params[:password_reset][:email])
    if user
      new_password = SecureRandom.urlsafe_base64
      user.update_attributes(:password => new_password)
      UserMailer.password_reset(user, new_password).deliver_now
      flash[:info] = "New password has send, Please check your email."
      redirect_to user
    else
      flash[:info] = "email does not exist."
      render "new"
    end
  end
end

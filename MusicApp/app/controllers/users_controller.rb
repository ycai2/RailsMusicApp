class UsersController < ApplicationController


  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user
      user.save!
      redirect_to "http://google.com"
    else
      flash.now[:errors] = ['Invalid user info!']
      render :new
    end
  end

  def show

  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end

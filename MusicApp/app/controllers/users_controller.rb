class UsersController < ApplicationController


  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user
      user.save!
      login_user!(user)
      redirect_to user_url(user.id)
    else
      flash.now[:errors] = ['Invalid user info!']
      render :new
    end
  end

  def show
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end

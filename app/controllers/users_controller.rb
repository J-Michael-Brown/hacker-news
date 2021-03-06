class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to articles_path
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end

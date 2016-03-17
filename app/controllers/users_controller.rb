class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all.shuffle
  end

  def create
  	@user = User.create user_params
  	if @user.persisted?
  		redirect_to users_path
  	else
  		render 'new'
  	end
  end

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end

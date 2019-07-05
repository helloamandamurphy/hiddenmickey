class UsersController < ApplicationController
  #loads sign up form
  def new
    @user = User.new
  end

  #sign up--saves and logs in user if required attributes are provided
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  #loads user show page
  def show
    if User.find_by(id: params[:id]) && session[:user_id]
      @user = User.find_by(id: params[:id])
      render :show
    else
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :location)
  end
end

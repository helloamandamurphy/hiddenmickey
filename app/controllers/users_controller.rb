class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/'
    end
  end

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

class SessionsController < ApplicationController
  #loads login page
  def new
    @user = User.new
  end

  #creates session for existing user
  def create
    #finds user by email
    @user = User.find_by(email: params[:user][:email])
    #if the user exists, and the password matches,
    #creates a new session, if not, it redirects to login page
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Sorry, your email or password was incorrect."
      redirect_to '/login'
    end
  end

  #logs out user
  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end

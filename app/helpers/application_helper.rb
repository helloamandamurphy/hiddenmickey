module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    session[:user_id].present?
  end

  def check_for_logged_in
    redirect_to '/' if !logged_in?
  end
end

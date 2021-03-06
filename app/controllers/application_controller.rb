class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!

  helper_method :current_user

  private

  def authenticate_user!
    redirect_to log_in_path unless current_user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
end

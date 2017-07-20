class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
    # Make the current_user method available to views, not just controllers ** 
    helper_method :current_user

    def current_user 
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def authorize
      redirect_to login_path, alert: 'Not authorized - you must be loggged in!' if current_user.nil?

      # if current_user.id <> @user.id ???
      # if current_user.id is equal to item id, then allow you to edit, delete, and add (check this in
      # controllers) in order to allow
    end
end

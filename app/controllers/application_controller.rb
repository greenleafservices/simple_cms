class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in prior to attempting to access this page."
      redirect_to(access_login_path)
        # redirect_to prevents the requested action from running
        # but we have an exception built in to the before_action process
        # above that doesn't run the process for login, attempt_login and logout
    end
  end
  
end

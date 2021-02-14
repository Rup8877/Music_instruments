class ApplicationController < ActionController::Base

  def current_user
  User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user


def authenticate_user!
  unless session[:user_id]
    redirect_to users_path
  end
end

  end

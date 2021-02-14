class SessionsController < ApplicationController

  def create
    user=User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:errors] =["Invalid Combination"]
    end
end


def destroy
  reset_session
  redirect_to :root
end


def google_create
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_path
  end

end

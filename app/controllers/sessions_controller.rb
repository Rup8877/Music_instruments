class SessionsController < ApplicationController

def new
  if current_user
   redirect_to root_path
  end
end

  def create
    user=User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:notice] = " Invalid Combination "
      redirect_to login_path
    end
end


def google_create
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_path
  end

def destroy
  if current_user
      session[ :user_id ] = nil
      session[ :omniauth ] = nil
      redirect_to root_path
    else
      flash[ :notice ] = " You are not logged in "
      redirect_to login_path
    end
end


end

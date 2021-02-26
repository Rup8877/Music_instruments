# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    if current_user
      redirect_to root_path
    else
    @user = User.new
  end
end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

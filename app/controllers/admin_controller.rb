class AdminController < ApplicationController
  before_action :ensure_admin_user!
  def index
  end
end

def ensure_admin_user!
  unless current_user and current_user.admin?
    redirect_to root_path
end
end

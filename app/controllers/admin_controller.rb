# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :ensure_admin_user!
  def index; end
end

def ensure_admin_user!
  redirect_to root_path unless current_user&.admin?
end

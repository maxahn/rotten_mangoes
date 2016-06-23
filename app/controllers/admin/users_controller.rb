class Admin::UsersController < ApplicationController
  before_action :admin_access_check
  def index
  end

  def show
  end

  def create
  end

  def update
  end

  def new
  end

  def destroy
  end

  def edit
  end

  protected

  def admin_access_check 
    unless current_user.is_admin?
      flash[:error] = "You must be an admin to access this page"
      redirect_to movies_path 
    end
  end
end

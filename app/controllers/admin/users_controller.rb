class Admin::UsersController < ApplicationController
  before_action :admin_access_check
  def index
    @users = User.order(:id).page(params[:page]).per(8)
  end

  def show
    @user = User.find(params[:id].to_i)
  end

  def create
  end

  def update
  end

  def new
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      UserMailer.user_destroyed_email(@user).deliver_now
      flash[:notice] = 'Account was destroyed' 
      redirect_to admin_users_path 
    else
      flash[:notice] = 'Account was not destroyed'
      redirect_to admin_user(@user)
    end
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

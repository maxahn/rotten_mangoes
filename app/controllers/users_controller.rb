class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) 
    if @user.save
      session[:user_id] = @user.id
      redirect_to movies_path, notice: "Account has succesfully been created!"
    else 
      flash.now[:alert] = "Log in failed..."
      render :new
    end
  end

  def admin_access_check 
    unless current_user.is_admin?
      flash[:error] = "You must be an admin to access this page"
      redirect_to movies_path 
    end
  end
  protected 

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :firstname, :lastname)
  end
end

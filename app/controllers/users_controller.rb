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

  def show 
    @user = User.find(current_user.id)
  end
  protected 

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :firstname, :lastname)
  end
end

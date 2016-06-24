class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to movies_path, notice: "#{user.firstname} has successfully logged in!"
    else
      flash[:error] = 'Email and password do not match.' 
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to movies_path, notice: "Sayonara!"
  end
end

class UserMailer < ApplicationMailer  
  default from: 'update@rottenmangoes.com'
  
  def user_destroyed_email(user)
    @user = user
    #@url = user_path
    mail(to: @user.email, subject: 'Account was deleted')
  end
end

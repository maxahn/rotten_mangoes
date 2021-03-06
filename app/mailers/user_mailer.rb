class UserMailer < ApplicationMailer  
  default from: 'update@rottenmangoes.com'
  
  def user_destroyed_email(user)
    @user = user
    #@url = '/admin/users/:id' 
    mail(to: @user.email, subject: 'Account was deleted')
  end
end

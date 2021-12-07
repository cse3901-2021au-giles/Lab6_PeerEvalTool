class UserMailer < ApplicationMailer
=begin
def password_reset(user, token) 
    @user = user 
    @token = token 
    mail(:to => @user.email, 
         :subject => 'Password Reset Notification') 
end
=end
end

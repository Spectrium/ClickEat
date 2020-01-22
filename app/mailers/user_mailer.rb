class UserMailer < ApplicationMailer
    default from: 'clickeat.mada@gmail.com'

    def welcome_email(user)
        @user = user 
        @url  = 'https://clickeat-mada.herokuapp.com/login' 
        mail(to: @user.email, subject: 'Bienvenue chez nous !!!') 
      end
end

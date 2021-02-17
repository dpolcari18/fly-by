class UserMailer < ApplicationMailer

    default from: 'notifications@example.com'

    def welcome_email
        @passenger = params[:passenger]
        @url  = '/'
        mail(to: @passenger.email, subject: 'Welcome to My Awesome Site')
    end

end

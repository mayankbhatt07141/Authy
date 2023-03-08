class VerificationMailer < ApplicationMailer

    def verfiy_email user
        @user = user
        mail(to: @user.email, subject: 'Verify your Email')
    end
end

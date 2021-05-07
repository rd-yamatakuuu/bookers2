class NotificationMailer < ApplicationMailer
  default from: 'from@example.com'

  def send_confirm_to_user
    @user = params[:user]
    mail(to: @user.email, subject: 'completed registration')
  end
end

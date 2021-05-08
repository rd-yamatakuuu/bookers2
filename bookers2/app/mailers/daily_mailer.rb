class DailyMailer < ApplicationMailer
  default from: 'from@example.com'

  def daily_mail
    @user = params[:user]
    mail(to: @user.email, subject: 'dai')
  end
end

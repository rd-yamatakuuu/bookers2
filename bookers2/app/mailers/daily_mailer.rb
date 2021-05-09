class DailyMailer < ApplicationMailer
  #default from: 'from@example.com'
  #default to: -> { User.pluck(:email) }

  #@user = params[:user]

  def daily_mail
    #default to: -> { User.pluck(:email) }
    mail(
      to: User.pluck(:email),
      subject: 'thanks')
    #@user = params[:user]
    #@user.each do |user|
    #mail to: user.email, subject: 'thanks'
    #mail(subject: 'dailymail')
  end

  def daily_mail_send
    DailyMailer.daily_mail.deliver
  end

end

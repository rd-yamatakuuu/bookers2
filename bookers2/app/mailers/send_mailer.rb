class SendMailer < ApplicationMailer
  
  def send_mail
    DailyMailer.daily_mail.deliver_later
  end
end

class NotificationMailer < ApplicationMailer
  default from: 'test-bookers2@gmail.com'
  
  def send_confirm_to_user(user)
    @user = user
    mail(
      subject: 'completed registration',
      to: @user.email
    ) do |format|
      format.text
      end
  end
end

class NotificationMailer < ApplicationMailer

  def send_notification_mail
    @user = params[:user]
    mail(to:@user.email, subject:"Customer Details")
  end

end

class UserMailer < ApplicationMailer
  def send_mail(id)
    @user = User.find(id)
    mail(to: @user.email)
  end
end

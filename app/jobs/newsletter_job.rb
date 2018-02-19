class NewsletterJob < ApplicationJob
  queue_as :default

  def perform(id)
    UserMailer.send_mail(id).deliver_now
  end
end

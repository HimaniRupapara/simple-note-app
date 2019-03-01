class EmailJob < ApplicationJob
  queue_as :default

  def perform(message,contact_email)
    EmailMailer.submission(message,contact_email).deliver
  end
end

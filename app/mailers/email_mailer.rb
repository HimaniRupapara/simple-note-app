class EmailMailer < ApplicationMailer

  default from: 'narolarubydeveloper1@gmail.com'

  def submission(message,contact_email)
    @message = message
    mail(to: contact_email, subject: 'Shared Note')
  end

end

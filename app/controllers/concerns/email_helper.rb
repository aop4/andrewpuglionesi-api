require 'sendgrid-ruby'
include SendGrid

module EmailHelper
  
  # Sends plain-text email via SendGrid with the system's no-reply from address
  # to my email address, by default. The to email can be customized, but the from
  # email must stay constant, as using a user's email address or something of
  # the sort can cause the message to go to spam. Returns the status code for
  # the SendGrid API request--202 if successful, something else otherwise.
  def send_email(subject_line, email_body, to_email=ENV['PERSONAL_EMAIL'])
    # don't ever set the from email to be a user's email address--mail server
    # may route it to spam
    from = Email.new(email: ENV['SYSTEM_FROM_EMAIL']) # SEE ABOVE
    to = Email.new(email: to_email)
    content = Content.new(type: 'text/plain', value: email_body)
    mail = SendGrid::Mail.new(from, subject_line, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    # status code will always be 202 for success
    response.status_code.to_i
  end
end
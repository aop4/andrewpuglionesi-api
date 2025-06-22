require 'aws-sdk-sesv2'
require 'logger'

module EmailHelper

  @@client = Aws::SESV2::Client.new(region: ENV['AWS_REGION'])

  @@logger = Logger.new(STDERR)

  # Attempts to send an email via AWS SES. If an exception is thrown, it
  # will be logged and suppressed.
  def try_send_email(subject_line, email_body, to_email=ENV['PERSONAL_EMAIL'])
    begin
      send_email(subject_line, email_body, to_email)
    rescue => exception
      @@logger.error("Failed to send email. An exception occurred: #{exception.message}")
    end
  end

  # Sends plain-text email via AWS SES to my email address, by default.
  # Returns response object from the AWS SES API.
  def send_email(subject_line, email_body, to_email=ENV['PERSONAL_EMAIL'])
    # don't ever set the from email to be a user's email address--mail server
    # may route it to spam
    response = @@client.send_email(
      {
        from_email_address: ENV['SYSTEM_FROM_EMAIL'],
        destination: {
          to_addresses: [to_email]
        },
        content: {
          simple: {
            subject: {
              data: subject_line
            },
            body: {
              text: {
                charset: 'UTF-8',
                data: email_body
              }
            }
          }
        }
      }
    )
    if !response.successful?
      @@logger.error('Failed to send email. Response received: ' + response.inspect)
    end
    return response
  end
end

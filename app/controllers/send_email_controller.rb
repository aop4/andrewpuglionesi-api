class SendEmailController < ApplicationController
  include EmailHelper

  # new is just the most logical method name for this action. Really, this
  # just handles a POST request for sending an email via the contact form.
  # parameters: from_email is the user's email address, name is the user's
  # name, and email_body is the user's message
  def new
    subject = "Website Contact Form - #{params[:name]} - #{params[:from_email]}"
    email_body = "#{params[:email_body]}"
    # send email with default sender and receiver--see email_helper.rb
    status = send_email(subject, email_body)
    # status code will always be 202 on success
    render json: {}, status: status
  end
end

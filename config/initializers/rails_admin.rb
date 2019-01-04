include BCrypt
include ActionController::HttpAuthentication::Basic::ControllerMethods
include EmailHelper

RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  
  # challenge the admin, and in the event of success, send a warning email in
  # case of a security breech. The email is only sent on success because of
  # short circuiting.
  # To make a new admin username/password, make hashes and store them in the environment.
  # Use these commands in irb:
  # require 'bcrypt'
  # BCrypt::Password.create("my_new_username") => new username hash as string
  # BCrypt::Password.create("my_new_password") => new password hash as string
  #
  # There are authentication gems I could use, but either they had to be
  # API only, which is a pain for me to actually use, or the API-only nature
  # of this rails app prevented their UIs from rendering. So here we are. The fact that
  # both the username and the password are encrypted makes me feel quite comfortable
  # foregoing salting, as it makes guessing monumentally expensive.
  config.authenticate_with do
    authenticate_or_request_with_http_basic do |username, password|
      Password.new(ENV['ADMIN_USERNAME_HASH']) == username &&
      Password.new(ENV['ADMIN_PASS_HASH']) == password &&
      send_email("andrewpuglionesi.com admin interface logged into", 
      "The admin interface was just logged into. If this wasn't you, "\
      "immediately change the username and password, consider upping security "\
      "measures, and check every single thing in the database.")
    end
  end
  
end

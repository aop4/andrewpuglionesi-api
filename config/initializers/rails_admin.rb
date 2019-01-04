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
  # short circuiting (when it's your own solution that's hacky, it can be
  # oddly appealing).
  config.authenticate_with do
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV.fetch('ADMIN_USERNAME') &&
      password == ENV.fetch('ADMIN_PASS') &&
      send_email("andrewpuglionesi.com admin interface logged into", 
      "The admin interface was just logged into. If this wasn't you, "\
      "immediately change the username and password, consider upping security "\
      "measures, and check every single thing in the database.")
    end
  end
  
end

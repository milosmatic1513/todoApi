class ApplicationController < ActionController::Base
  include Response
  include ExceptionHandler
  include CurrentUserConcern
  skip_before_action :verify_authenticity_token

end

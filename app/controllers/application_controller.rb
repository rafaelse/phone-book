class ApplicationController < ActionController::Base
  include UserAuthorization
  protect_from_forgery with: :null_session
  before_action :authorize
end

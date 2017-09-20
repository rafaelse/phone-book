class ApplicationController < ActionController::Base
  include UserAuthorization
  protect_from_forgery with: :exception
  before_action :authorize
end

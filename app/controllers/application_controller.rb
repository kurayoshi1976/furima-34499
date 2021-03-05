class ApplicationController < ActionController::Base
  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      p(p(username == p(ENV["BASIC_AUTH_USER"])) && p(p(password == p(ENV["BASIC_AUTH_PASSWORD"]))
    end
  end
  
end

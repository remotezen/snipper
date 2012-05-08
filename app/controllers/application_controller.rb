class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper
  def configure_app
    @config = YAML::load(File.open("#{Rails.root}/config/app_config.yml"))
  end
  helper_method :configure_app
end

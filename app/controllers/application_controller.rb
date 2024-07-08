require "application_responder"

class ApplicationController < ActionController::Base
  before_action :authenticate_user!  

  private

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || authenticated_root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    unauthenticated_root_path
  end
  
end

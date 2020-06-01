class ApplicationController < ActionController::API
  rescue_from Mongoid::Errors::DocumentNotFound, :with => :catch_not_found

  private 
    
  def catch_not_found
    render json: "Not found", status: :not_found
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_authenticated_user

  private

  def require_authenticated_user
    redirect_to new_session_path
  end
end

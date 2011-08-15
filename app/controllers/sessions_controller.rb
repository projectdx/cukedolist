class SessionsController < ApplicationController
  skip_before_filter :require_authenticated_user, :only => [:logout, :new]

  def logout
    reset_session
    redirect_to root_path
  end

  def new
    render :nothing => true
  end
end

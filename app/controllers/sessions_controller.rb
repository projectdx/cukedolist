class SessionsController < ApplicationController
  attr_reader :login_session

  skip_before_filter :require_authenticated_user, :only => [:logout, :new, :create]

  def logout
    reset_session
    redirect_to root_path
  end

  def new
    @login_session = LoginSession.new
  end

  def create
    login_session = LoginSession.create!(params[:login_session])
    self.current_account = login_session.account
    redirect_to todo_list_path
  rescue LoginSession::AccessDenied => e
    @login_session = e.login_session
    render :action => :new, :status => 403
  end
end

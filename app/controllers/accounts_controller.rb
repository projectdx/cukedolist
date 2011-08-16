class AccountsController < ApplicationController
  attr_reader :account

  skip_before_filter :require_authenticated_user, :only => [:new, :create]

  def new
    @account = Account.new
  end

  def create
    self.current_account = Account.create!(params[:account])
    redirect_to todo_list_path
  rescue ActiveRecord::RecordInvalid => e
    @account = e.record
    render :action => :new, :status => 403
  end
end

class UsersController < ApplicationController
  attr_reader :user, :errors

  skip_before_filter :require_authenticated_user, :only => [:new, :create]

  def initialize
    super
    @errors = []
  end

  def new
    @user = Account.new
  end

  def create
    self.current_account = Account.create!(params[:account])
    redirect_to todo_list_path
  rescue ActiveRecord::RecordInvalid => e
    @user = e.record
    @errors = @user.errors.full_messages
    render :action => :new, :status => 403
  end
end

class AccountsController < ApplicationController
  attr_reader :account

  skip_before_filter :require_authenticated_user, :only => [:new]

  def new
    @account = Account.new
  end
end

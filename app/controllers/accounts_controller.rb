class AccountsController < ApplicationController
  skip_before_filter :require_authenticated_user, :only => [:new]

  def new
    render :nothing => true
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_authenticated_user

  def current_account
    @current_account ||= begin
                           account_id = session[:account_id]
                           if account_id
                             Account.find(account_id)
                           else
                             nil
                           end
                         rescue ActiveRecord::RecordNotFound
                           reset_session
                           nil
                         end
  end

  def current_account=(account)
    if account.kind_of?(Account)
      @current_account = account
      session[:account_id] = account.id
    else
      raise ArgumentError, "Only objects of type Account can be assigned."
    end
  end

  private

  def require_authenticated_user
    redirect_to new_session_path
  end
end

class Api::V1::AccountsController < ActionController::Base
  def create
    account = Account.create!(params[:account])
    render :json => account, :status => 201
  rescue ActiveRecord::RecordInvalid => e
    render :json => e.record.errors.full_messages, :status => 403
  end
end

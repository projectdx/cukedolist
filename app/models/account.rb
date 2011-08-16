class Account < ActiveRecord::Base
  validates_presence_of :email_address, :password
  validates_uniqueness_of :email_address
  validates_confirmation_of :password
end

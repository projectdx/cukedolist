class LoginSession
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  class AccessDenied < RuntimeError
    attr_reader :login_session

    def initialize(message, login_session)
      super(message)
      @login_session = login_session
    end
  end

  attr_accessor :email_address, :password, :account

  def self.create!(*args)
    new(*args).tap do |login_session|
      login_session.authenticate!
    end
  end

  def authenticate!
    @account = Account.find_by_email_address_and_password(@email_address, @password)
    raise AccessDenied.new("Authentication failed", self) if @account.nil?
  end

  def initialize(attributes = {})
    @email_address = attributes[:email_address]
    @password = attributes[:password]
  end

  def ==(other)
    email_address == other.email_address \
      && password == other.password
  end

  def persisted?
    false
  end
end

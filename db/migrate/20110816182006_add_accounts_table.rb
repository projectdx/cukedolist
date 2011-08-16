class AddAccountsTable < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :email_address, :null => false
      t.string :password, :null => false
      t.timestamps
    end
    add_index :accounts, :email_address, :unique => true
  end

  def self.down
    drop_table :accounts
  end
end

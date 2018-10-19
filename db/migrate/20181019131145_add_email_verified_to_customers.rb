class AddEmailVerifiedToCustomers < ActiveRecord::Migration[5.2]
  def change
  	add_column :customers, :is_email_verified, :boolean, :default => false
  	add_column :customers, :email_verifification_token, :string
  end
end

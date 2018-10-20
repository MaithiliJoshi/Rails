class DelEmailVerifificationTokenFromCustomers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :customers, :email_verifification_token
  end
end

class AddColumnAuthTypeCustomers < ActiveRecord::Migration[5.2]
  def change
  	add_column :customers, :auth_type, :string, default: 'email'
  end
end

class AddMobileCustomers < ActiveRecord::Migration[5.2]
  def change
  	add_column :customers, :mobile, :string 
  end
end

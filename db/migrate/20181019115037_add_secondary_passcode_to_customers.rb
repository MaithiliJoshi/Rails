class AddSecondaryPasscodeToCustomers < ActiveRecord::Migration[5.2]
  def change
  	add_column :customers, :secondary_passcode, :string
  end
end

class ChangeColumnPassword < ActiveRecord::Migration[5.2]
  def change
  	rename_column :customers, :password, :password_digest
  end
end

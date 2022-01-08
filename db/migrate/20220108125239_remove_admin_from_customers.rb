class RemoveAdminFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :admin, :boolean
  end
end

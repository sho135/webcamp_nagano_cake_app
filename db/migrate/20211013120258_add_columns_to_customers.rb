class AddColumnsToCustomers < ActiveRecord::Migration[5.2]
  def change

    add_column :customers,:is_active, :boolean
  end
end

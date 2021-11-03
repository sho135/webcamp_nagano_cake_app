class RemoveTaxIncludedPriceFromOrderDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_details, :tax_included_price, :integer
  end
end

class AddRetailerToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :retailer, references: :stores, index: true
    add_foreign_key :orders, :stores, column: :retailer_id
  end
end

class AddTailorToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :tailor, references: :stores, index: true
    add_foreign_key :orders, :stores, column: :tailor_id
  end
end

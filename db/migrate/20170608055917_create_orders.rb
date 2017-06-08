class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.references :retailer, references: :stores, index: true
    end
  end
end

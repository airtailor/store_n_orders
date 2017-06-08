class CreateTailorOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :tailor_orders do |t|
      t.references :tailor, references: :stores, index: true
    end
  end
end

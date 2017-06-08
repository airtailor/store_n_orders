class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.references :requester, references: :orders
      t.references :provider, references: :orders
    end
  end
end

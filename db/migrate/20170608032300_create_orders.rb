class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.belongs_to :store, index: true
      t.timestamps
    end
  end
end

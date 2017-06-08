class AddTypeToStores < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :type, :string
  end
end

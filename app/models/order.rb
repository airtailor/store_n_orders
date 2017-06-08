class Order < ApplicationRecord
  belongs_to :retailer,
        class_name: "Store",
        foreign_key: "retailer_id"
end

class Order < ApplicationRecord
  belongs_to :retailer,
        class_name: "Retailer",
        foreign_key: "retailer_id"

  belongs_to :tailor, 
        class_name: "Tailor",
        foreign_key: "tailor_id"
end

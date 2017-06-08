class Order < ApplicationRecord
  validates :retailer, presence: true
end

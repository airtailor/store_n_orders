class TailorOrder < Order
  validates :tailor, presence: true

  belongs_to :tailor,
        class_name: "Tailor",
        foreign_key: "provider_id"

  belongs_to :retailer,
        class_name: "Retailer",
        foreign_key: "requester_id"

  def stores
    { retailer: self.retailer, tailor: self.tailor }
  end
end

class TailorOrder < Order
  belongs_to :tailor,
        class_name: "Tailor",
        foreign_key: "Tailor_id"

  belongs_to :retailer,
        class_name: "Retailer",
        foreign_key: "retailer_id"

  def stores
    {
      retailer: self.retailer,
      tailor: self.tailor
    }
  end
end

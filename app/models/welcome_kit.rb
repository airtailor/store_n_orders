class WelcomeKit < Order
  belongs_to :retailer,
        class_name: "Retailer",
        foreign_key: "retailer_id"

  def stores
    {
      retailer: self.retailer
    }
  end
end

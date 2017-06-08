class WelcomeKit < Order
  belongs_to :retailer,
    class_name: "Retailer",
    foreign_key: "provider_id"

  after_initialize :init

  def init
    self.retailer ||= Retailer.where(name: "Air Tailor").first
  end
end

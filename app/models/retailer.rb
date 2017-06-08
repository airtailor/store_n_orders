class Retailer < Store
  validates :name, presence: true, uniqueness: true
  has_many :orders

  def orders
    Order.where(requester_id: self.id)
  end
end

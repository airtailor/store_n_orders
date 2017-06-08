class Tailor < Store
  validates :name, uniqueness: true
  has_many :orders

 def orders
    Order.where(provider_id: self.id)
  end
end

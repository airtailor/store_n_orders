class Tailor < Store
  validates :name, uniqueness: true
  has_many :orders
end

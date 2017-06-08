class Headquarters < Store
  validates :name, uniqueness: true
  # has_many :orders
end

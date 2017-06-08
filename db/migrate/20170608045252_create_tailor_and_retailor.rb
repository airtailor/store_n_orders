class CreateTailorAndRetailor < ActiveRecord::Migration[5.1]
  def change
    create_table :tailors do |t|
    end

    create_table :retailers do |t|
    end
  end
end

class AddLocationToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :lat, :decimal, precision: 10, scale: 6
    add_column :restaurants, :lng, :decimal, precision: 10, scale: 6
  end
end

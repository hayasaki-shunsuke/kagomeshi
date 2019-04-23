class RenameRestaurantNameToNameToRestaurants < ActiveRecord::Migration[5.2]
  def change
    rename_column :restaurants, :restaurant_name, :name
  end
end

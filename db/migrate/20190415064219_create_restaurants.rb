class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :restaurant_name
      t.string :address
      t.text :business_hours
      t.text :memo

      t.timestamps
    end
  end
end

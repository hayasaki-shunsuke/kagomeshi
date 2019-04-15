json.extract! restaurant, :id, :restaurant_name, :address, :business_hours, :memo, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)

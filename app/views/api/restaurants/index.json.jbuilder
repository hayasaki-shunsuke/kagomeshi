json.array! @restaurants do |restaurant|
  json.(restaurant, :id, :name, :business_hours, :lat, :lng)
end

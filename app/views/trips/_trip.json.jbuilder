json.extract! trip, :id, :name, :description, :categories, :amount_of_travellers, :amount_of_children, :pets, :original_trip_id, :user_id, :created_at, :updated_at
json.url trip_url(trip, format: :json)

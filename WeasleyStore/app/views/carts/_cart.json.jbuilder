json.extract! cart, :id, :user_id, :items, :street1, :street2, :city, :state, :zip, :created_at, :updated_at
json.url cart_url(cart, format: :json)

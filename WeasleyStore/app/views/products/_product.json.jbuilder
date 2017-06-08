json.extract! product, :id, :product_name, :images, :weight, :price_cents, :created_at, :updated_at
json.url product_url(product, format: :json)

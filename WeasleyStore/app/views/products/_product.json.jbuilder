json.extract! product, :id, :product_name, :images, :weight, :galleons, :quantity, :created_at, :updated_at
json.url product_url(product, format: :json)

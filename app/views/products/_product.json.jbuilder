json.extract! product, :id, :type, :price, :demand, :created_at, :updated_at
json.url product_url(product, format: :json)
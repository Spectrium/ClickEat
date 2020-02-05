json.extract! order, :id, :confirmed, :payed, :created_at, :updated_at
json.url order_url(order, format: :json)

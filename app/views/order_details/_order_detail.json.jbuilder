json.extract! order_detail, :id, :line_item_id, :order_id, :created_at, :updated_at
json.url order_detail_url(order_detail, format: :json)

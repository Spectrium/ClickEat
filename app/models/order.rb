class Order < ApplicationRecord
  has_many :line_items, class_name: "LineItem"
end

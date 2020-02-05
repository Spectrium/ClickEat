class Order < ApplicationRecord
  has_many :orderdetails, class_name: "OrderDetail"
end

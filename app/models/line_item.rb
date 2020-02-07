class LineItem < ApplicationRecord
  belongs_to :dish
  belongs_to :cart
  belongs_to :order, class_name:"Order", optional:true

  # LOGIC
  def total_price
    self.quantity * self.dish.price
  end
end

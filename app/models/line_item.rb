class LineItem < ApplicationRecord
  belongs_to :dish
  belongs_to :cart

  # LOGIC
  def total_price
    self.quantity * self.dish.price
  end
end

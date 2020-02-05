class Cart < ApplicationRecord
    #relation
    belongs_to :user
    has_many :line_items, class_name: "LineItem", dependent: :destroy
    # LOGIC
  def sub_total
    sum = 0
    self.line_items.each do |line_item|
      sum+= line_item.total_price
    end
    return sum
  end
end

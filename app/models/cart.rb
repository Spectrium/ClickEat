class Cart < ApplicationRecord
    #relation
    belongs_to :user
    has_many :line_items, class_name: "LineItem"
    # LOGIC

  def sub_total
    sum = 0
    self.line_items.where(done:false).each do |line_item|
      sum+= line_item.total_price
    end
    return sum
  end

  def list_item_not_to_order
    self.line_items.where(done:false)
  end
end

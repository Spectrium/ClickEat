class CreateDetailsOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :details_orders do |t|
      t.references :dish
      t.references :order
      t.timestamps
    end
  end
end

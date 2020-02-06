class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.boolean :confirmed, :default => false
      t.boolean :payed, :default => false
      t.decimal :amount, precision: 10, scale: 2
      t.timestamps
    end
  end
end

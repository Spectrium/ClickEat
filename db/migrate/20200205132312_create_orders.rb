class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.boolean :confirmed
      t.boolean :payed

      t.timestamps
    end
  end
end

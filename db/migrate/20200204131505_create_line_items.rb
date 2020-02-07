class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.integer :quantity, :default => 1
      #Ex:- :default =>''
      t.references :dish, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.references :order, foreign_key: true
      t.boolean :done, default: false
      t.boolean :received, default: false
      t.boolean :canceled, default: false
      t.boolean :payed, default: false  
      t.decimal :amount, precision: 10, scale: 2
      t.timestamps
    end
  end
end

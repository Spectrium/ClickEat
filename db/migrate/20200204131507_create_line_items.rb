class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.integer :quantity, :default => 1
      #Ex:- :default =>''
      t.references :dish, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.boolean :done, default: false
      t.timestamps
    end
  end
end
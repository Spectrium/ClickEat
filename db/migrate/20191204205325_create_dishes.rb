class CreateDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.time :preparation_time
      t.string :picture
      t.references :restaurant, index: true
      t.references :category_dish, index: true
      t.references :type, index: true
      t.timestamps
    end
  end
end

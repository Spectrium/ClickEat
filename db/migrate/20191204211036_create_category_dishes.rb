class CreateCategoryDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :category_dishes do |t|
      t.string :name
      t.string :picture
      t.references :type, index: true
      t.timestamps
    end
  end
end

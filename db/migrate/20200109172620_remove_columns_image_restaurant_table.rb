class RemoveColumnsImageRestaurantTable < ActiveRecord::Migration[6.0]
  def up
    remove_column :restaurants, :logo
    remove_column :restaurants, :picture
  end
 
  def down
    add_column :restaurants, :logo, :string
    add_column :restaurants, :picture, :string
  end
end

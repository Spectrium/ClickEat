class UpdateColumnPreparationTimeDishes < ActiveRecord::Migration[6.0]
  def up
    remove_column :dishes, :preparation_time
    add_column :dishes, :preparation_time, :integer
  end
  def down
    remove_column :dishes, :preparation_time, :integer
    add_column :dishes, :preparation_time, :time
  end
  
end

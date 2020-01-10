class AddCachedLikesToDishes < ActiveRecord::Migration[6.0]
  def self.up
    add_column :dishes, :cached_votes_total, :integer, :default => 0
    add_column :dishes, :cached_votes_score, :integer, :default => 0
    add_column :dishes, :cached_votes_up, :integer, :default => 0
    add_column :dishes, :cached_votes_down, :integer, :default => 0
    add_index  :dishes, :cached_votes_total
    add_index  :dishes, :cached_votes_score
    add_index  :dishes, :cached_votes_up
    add_index  :dishes, :cached_votes_down

    
    Dish.find_each(&:update_cached_votes)
  end

  def self.down
    remove_column :dishes, :cached_votes_total
    remove_column :dishes, :cached_votes_score
    remove_column :dishes, :cached_votes_up
    remove_column :dishes, :cached_votes_down
  end
end

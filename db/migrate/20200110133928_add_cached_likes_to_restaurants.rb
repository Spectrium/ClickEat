class AddCachedLikesToRestaurants < ActiveRecord::Migration[6.0]
  def self.up
    add_column :restaurants, :cached_votes_total, :integer, :default => 0
    add_column :restaurants, :cached_votes_score, :integer, :default => 0
    add_column :restaurants, :cached_votes_up, :integer, :default => 0
    add_column :restaurants, :cached_votes_down, :integer, :default => 0
    add_index  :restaurants, :cached_votes_total
    add_index  :restaurants, :cached_votes_score
    add_index  :restaurants, :cached_votes_up
    add_index  :restaurants, :cached_votes_down

    
    #Restaurant.find_each(&:update_cached_votes)
  end

  def self.down
    remove_column :restaurants, :cached_votes_total
    remove_column :restaurants, :cached_votes_score
    remove_column :restaurants, :cached_votes_up
    remove_column :restaurants, :cached_votes_down
  end
end

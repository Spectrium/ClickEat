class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.text :description
      t.string :logo
      t.string :picture
      t.string :phone_number
      t.string :email
      t.timestamps
    end
  end
end

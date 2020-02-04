class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.text :description
      t.string :logo , default: "about-img.jpg"
      t.string :picture , default: "full-logo.png"
      t.string :phone_number
      t.string :email
      t.references :subscription, index: true
      t.timestamps
    end
  end
end

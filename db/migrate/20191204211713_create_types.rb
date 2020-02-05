class CreateTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :types do |t|
      t.string :name
      t.string :icon
      t.string :logo
      t.timestamps
    end
  end
end

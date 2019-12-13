class CreateSpecialities < ActiveRecord::Migration[6.0]
  def change
    create_table :specialities do |t|
      t.string :name
      t.references :category, index: true
      t.timestamps
    end
  end
end

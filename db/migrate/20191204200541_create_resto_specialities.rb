class CreateRestoSpecialities < ActiveRecord::Migration[6.0]
  def change
    create_table :resto_specialities do |t|
      t.references :restaurant, index: true
      t.references :speciality, index: true
      t.timestamps
    end
  end
end

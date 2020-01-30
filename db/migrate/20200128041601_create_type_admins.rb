class CreateTypeAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :type_admins do |t|
      t.string :name

      t.timestamps
    end
  end
end

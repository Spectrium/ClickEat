class UpdateAdmins < ActiveRecord::Migration[6.0]
  def up
    # add_column :admins, :type_admin, :integer
    # add_reference :admins, :type_admin, foreign_key: true
    change_table :admins do |t|
      # t.add_column :admins, :type_admin, :integer
      t.belongs_to :type_admin, index: true
    end
  end

  def down
    # remove_reference :admins, :type_admin, index:true, foreign_key: true
    remove_column :admins, :type_admin

  end
  
end

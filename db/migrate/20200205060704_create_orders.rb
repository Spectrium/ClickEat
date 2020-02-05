class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.boolean :confirmed, :default => false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
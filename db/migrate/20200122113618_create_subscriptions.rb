class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.decimal :price
      t.string :privilege
      t.string :color
      t.references :subscription_type, index: true

      t.timestamps
    end
  end
end

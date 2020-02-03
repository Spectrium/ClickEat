class CreateSubscriptionPrivileges < ActiveRecord::Migration[6.0]
  def change
    create_table :subscription_privileges do |t|
      t.text :privilege
      t.references :subscription, index: true
      t.timestamps
    end
  end
end

class AddPhoneNumberToUser < ActiveRecord::Migration[6.0]
  def self.up
    add_column :users, :phone_number, :string
  end

  def self.down
    remove_column :users, :phone_number, :string
  end
end

class AddAddressToFriends < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :address, :string
  end
end

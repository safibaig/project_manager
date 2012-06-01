class AddAddressFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :street, :string

    add_column :users, :city, :string

    add_column :users, :state, :string

    add_column :users, :country, :string
    remove_column :users, :address
  end
end

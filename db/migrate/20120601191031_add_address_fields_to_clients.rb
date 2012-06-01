class AddAddressFieldsToClients < ActiveRecord::Migration
  def change
    add_column :clients, :street, :string

    add_column :clients, :city, :string

    add_column :clients, :state, :string

    add_column :clients, :country, :string
    remove_column :clients, :address
  end
end

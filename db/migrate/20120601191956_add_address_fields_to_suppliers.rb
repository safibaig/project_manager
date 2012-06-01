class AddAddressFieldsToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :street, :string

    add_column :suppliers, :city, :string

    add_column :suppliers, :state, :string

    add_column :suppliers, :country, :string
    remove_column :suppliers, :address
  end
end

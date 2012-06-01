class AddAddressFieldsToProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :street, :string
    add_column :prospects, :city, :string
    add_column :prospects, :state, :string
    add_column :prospects, :country, :string
    remove_column :prospects, :address
  end
end

class AddImageToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :image, :string

  end
end

class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :business_type
      t.integer :business_unit_id
      t.string :name
      t.string :phone
      t.string :mobile
      t.string :email
      t.string :website
      t.text :address

      t.timestamps
    end
  end
end

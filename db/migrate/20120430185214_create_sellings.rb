class CreateSellings < ActiveRecord::Migration
  def change
    create_table :sellings do |t|
      t.integer :supplier_id
      t.integer :business_unit_id

      t.timestamps
    end
  end
end

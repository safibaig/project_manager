class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.integer :client_id
      t.integer :business_unit_id

      t.timestamps
    end
  end
end

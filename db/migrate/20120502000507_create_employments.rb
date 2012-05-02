class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.integer :supplier_id
      t.integer :project_id

      t.timestamps
    end
  end
end

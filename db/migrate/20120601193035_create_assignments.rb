class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
    add_index :assignments, [:project_id, :user_id]
  end
end

class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :client_id
      t.integer :user_id
      t.integer :business_unit_id
      t.string :project_manager
      t.integer :status
      t.string :lead_source
      t.decimal :estimation

      t.timestamps
    end
  end
end

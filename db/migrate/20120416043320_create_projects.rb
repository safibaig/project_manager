class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :client_id
      t.integer :user_id
      t.string :business_unit
      t.string :project_manager
      t.integer :real_status
      t.integer :ideal_status
      t.string :lead_source
      t.decimal :estimation

      t.timestamps
    end
  end
end

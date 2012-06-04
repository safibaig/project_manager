class RemoveProjectManagerFromProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :project_manager
    add_column :projects, :project_manager_id, :integer
  end

  def down
    add_column :projects, :project_manager, :string
    remove_column :projects, :project_manager_id
  end
end

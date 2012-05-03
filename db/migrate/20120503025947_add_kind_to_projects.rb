class AddKindToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :kind, :string, :default => "External"

  end
end

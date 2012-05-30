class AddIsClientToProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :is_client, :boolean, :default => false

  end
end

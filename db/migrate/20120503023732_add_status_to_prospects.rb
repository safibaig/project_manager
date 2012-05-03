class AddStatusToProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :status, :integer, :default => 2

  end
end

class AddProspectIdToInterests < ActiveRecord::Migration
  def change
    add_column :interests, :prospect_id, :integer

  end
end

class AddProspectToClients < ActiveRecord::Migration
  def change
    add_column :clients, :type, :string, :default => "Client", :null => false
  end
end

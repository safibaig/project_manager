class AddMissingFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :text, :default => ""

    add_column :users, :phone, :string, :default => ""

    add_column :users, :cv, :string, :default => ""

    add_column :users, :portfolio, :string, :default => ""

    add_column :users, :degree, :string, :default => ""

    add_column :users, :intern, :boolean, :default => false

  end
end

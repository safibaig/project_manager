class AddCompanySizeToProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :company_size, :string

  end
end

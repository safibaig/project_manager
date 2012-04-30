class CreateProspects < ActiveRecord::Migration
  def change
  create_table :prospects do |t|
        t.string :business_type
        t.string :interests
        t.string :company_name
        t.string :contact_name
        t.string :phone
        t.string :mobile
        t.string :email
        t.string :website
        t.text :address

        t.timestamps
    end
  end
end

class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :partner_name
      t.integer :user_id
      t.string :status
      t.string :business_type
      t.string :name
      t.string :phone
      t.string :email
      t.string :website
      t.text :address

      t.timestamps
    end
  end
end

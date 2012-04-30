class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :company_name
      t.string :contact_name
      t.string :business_type
      t.text :address
      t.string :phone
      t.string :email
      t.string :bank_account    

      t.timestamps
    end
  end
end

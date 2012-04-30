# == Schema Information
#
# Table name: suppliers
#
#  id            :integer         not null, primary key
#  company_name  :string(255)
#  contact_name  :string(255)
#  business_type :string(255)
#  address       :text
#  phone         :string(255)
#  email         :string(255)
#  bank_account  :string(255)
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

class Supplier < ActiveRecord::Base
  
  has_many :sellings
  has_many :business_units, :through => :sellings
  
  attr_reader :business_unit_tokens
  
  attr_accessible :company_name, :contact_name, :business_unit_tokens,
                  :address, :phone, :email, :bank_account
  
  validates :company_name, :contact_name,
            :address, :phone, :email, :bank_account, :presence => true

  def business_unit_tokens=(ids)
    self.business_unit_ids = ids.split(",")
  end

  def business_unit_sellings
    self.business_units.map(&:name)
  end

end
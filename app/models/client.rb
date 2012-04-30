# == Schema Information
#
# Table name: clients
#
#  id            :integer         not null, primary key
#  business_type :string(255)
#  interests     :string(255)
#  company_name  :string(255)
#  contact_name  :string(255)
#  phone         :string(255)
#  mobile        :string(255)
#  email         :string(255)
#  website       :string(255)
#  address       :text
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

class Client < ActiveRecord::Base
  has_many :projects
  has_many :interests
  has_many :business_units, :through => :interests
  
  attr_reader :business_unit_tokens
  
  attr_accessible :business_type, :company_name, :contact_name,
                  :phone, :mobile, :email, :website, :address, :business_unit_tokens
  
  validates :company_name, 
            :contact_name, :phone, :mobile, :email,
            :presence => true 
            
  def to_s
    self.company_name.capitalize
  end
  
  def business_unit_tokens=(ids)
    self.business_unit_ids = ids.split(",")
  end
  
  def business_unit_interests
    self.business_units.map(&:name)
  end
  
end

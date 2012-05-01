# == Schema Information
#
# Table name: prospects
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

class Prospect < ActiveRecord::Base
  
  has_many :interests
  has_many :business_units, :through => :interests
  has_many :comments, :as => :commentable
  attr_reader :business_unit_tokens
  
  validates :business_type, :company_name, 
            :contact_name, :phone, :mobile, :email,
            :presence => true
  
  attr_accessible :business_type, :company_name, :contact_name,
                  :phone, :mobile, :email, :website, :address, :business_unit_tokens
  
  def business_unit_tokens=(ids)
    self.business_unit_ids = ids.split(",")
  end
  
  def business_unit_interests
    self.business_units.map(&:name)
  end
end

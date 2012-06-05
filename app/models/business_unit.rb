# == Schema Information
#
# Table name: business_units
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class BusinessUnit < ActiveRecord::Base
  has_many :interests
  has_many :projects
  has_many :sellings
  has_many :clients, :through => :interests
  has_many :prospects, :through => :interests
  has_many :suppliers, :through => :sellings
  
  def to_s
    self.name.titleize
  end
  
end

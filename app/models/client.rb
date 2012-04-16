# == Schema Information
#
# Table name: clients
#
#  id               :integer         not null, primary key
#  business_type    :string(255)
#  business_unit_id :integer
#  name             :string(255)
#  phone            :string(255)
#  mobile           :string(255)
#  email            :string(255)
#  website          :string(255)
#  address          :text
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

class Client < ActiveRecord::Base
  has_many :projects
  
  validates :business_type, :business_unit_id, :name, :phone, :email,
            :website, :address, :presence => true
  
  
end

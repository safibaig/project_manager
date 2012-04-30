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
end

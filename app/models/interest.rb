class Interest < ActiveRecord::Base
  belongs_to :client
  belongs_to :business_unit
  belongs_to :prospect
end

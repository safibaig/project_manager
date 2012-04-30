class Selling < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :business_unit
end

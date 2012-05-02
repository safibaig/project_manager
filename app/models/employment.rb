class Employment < ActiveRecord::Base
  belongs_to :project
  belongs_to :supplier
end

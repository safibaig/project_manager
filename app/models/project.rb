# == Schema Information
#
# Table name: projects
#
#  id               :integer         not null, primary key
#  name             :string(255)
#  client_id        :integer
#  user_id          :integer
#  business_unit_id :string(255)
#  project_manager  :string(255)
#  real_status      :integer
#  ideal_status     :integer
#  lead_source      :string(255)
#  estimation       :decimal(, )
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

class Project < ActiveRecord::Base
  
  belongs_to :client
  
  validates :name, :project_manager, :status,
            :lead_source, :estimation, :presence => true
  
  validates :estimation, :status, :numericality => true
  
  
end

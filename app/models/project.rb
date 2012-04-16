class Project < ActiveRecord::Base
  
  validates :name, :project_manager, :real_status, :ideal_status,
            :lead_source, :estimation, :presence => true
  
  validates :estimation, :ideal_status, :real_status, :numericality => true
  
end

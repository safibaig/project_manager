class PagesController < ApplicationController
  before_filter :authenticate_user!
  
  def home
    @external_projects = Project.external.count
    @projects_business_planning = Project.business_planning
    @projects_graphic_design = Project.graphic_design
    @projects_industrial_design = Project.industrial_design
    @projects_software = Project.software
    @projects_r_and_d = Project.research_and_development
    @projects_lost = Project.canceled
    @projects_potential = Project.potential
    @projects_billed = Project.operation
    @projects_paid = Project.delivered
    @employees = User.all
  end
end

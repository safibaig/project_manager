class PagesController < ApplicationController
  before_filter :authenticate_user!
  
  def home
    @projects_business_planning = Project.business_planning
    @projects_graphic_design = Project.graphic_design
    @projects_industrial_design = Project.industrial_design
    @projects_software = Project.software
    @projects_r_and_d = Project.research_and_development
    @project_source_website = Project.source("Website")
    @project_source_facebook = Project.source("Facebook")
    @project_source_twitter = Project.source("Twitter")
    @project_source_linkedin = Project.source("Linkedin")
    @project_source_magazine = Project.source("Innovative magazine")
    @project_source_youtube = Project.source("YouTube")
    @project_source_email = Project.source("Email")
    @project_source_recommendation = Project.source("Recommendation")
    @project_source_employees = Project.source("Employees")
    @project_source_lab = Project.source("Innovative Lab")
    @project_source_phone = Project.source("Phone")
  end
end

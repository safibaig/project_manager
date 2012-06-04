module ApplicationHelper
  
  def title
    base_title = "Project Manager :: Invomex"
  end
  
  def admin_area(&block)
    capture(&block) if user_signed_in?
  end
  
  def prepopulate_interests(object)
    object.business_units.map(&:attributes).to_json
  end
  
  def set_class_if_current_path(resource)
     resource.split(",").each{|r| return "active" if params[:controller] == r }
  end
  
  def bran_path
    if user_signed_in?
      home_path
    else
      root_path
    end
  end
  
  def render_index(index)
    if params[:page].present?
      index + (2 * params[:page].to_i) - 1 
    else
      index + 1
    end
  end
  
  def project_status_business(projects)
    projects_array = ""
    projects_array << "#{projects.canceled.count},"
    projects_array << "#{projects.potential.count},"
    projects_array << "#{projects.operation.count},"
    projects_array << "#{projects.delivered.count}"
    projects_array
  end
  
  def project_status(projects)
    projects_array = ""
    projects_array << "#{projects.business_planning.count},"
    projects_array << "#{projects.graphic_design.count},"
    projects_array << "#{projects.industrial_design.count},"
    projects_array << "#{projects.software.count},"
    projects_array << "#{projects.research_and_development.count}"
    projects_array
  end
  
end

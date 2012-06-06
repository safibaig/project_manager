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
  
  def project_status_money_bp(projects)
    projects_array = ""
    projects_array << "#{projects.canceled.estimation_sum},"
    projects_array << "#{projects.potential.estimation_sum},"
    projects_array << "#{projects.operation.estimation_sum},"
    projects_array << "#{projects.delivered.estimation_sum}"
    projects_array
  end
  
  def project_status_money_gd(projects)
    projects_array = ""
    projects_array << "#{projects.canceled.estimation_sum},"
    projects_array << "#{projects.potential.estimation_sum},"
    projects_array << "#{projects.operation.estimation_sum},"
    projects_array << "#{projects.delivered.estimation_sum}"
    projects_array
  end
  
  def project_status_money_id(projects)
    projects_array = ""
    projects_array << "#{projects.canceled.estimation_sum},"
    projects_array << "#{projects.potential.estimation_sum},"
    projects_array << "#{projects.operation.estimation_sum},"
    projects_array << "#{projects.delivered.estimation_sum}"
    projects_array
  end
  
  def project_status_money_software(projects)
    projects_array = ""
    projects_array << "#{projects.canceled.estimation_sum},"
    projects_array << "#{projects.potential.estimation_sum},"
    projects_array << "#{projects.operation.estimation_sum},"
    projects_array << "#{projects.delivered.estimation_sum}"
    projects_array
  end
  
  def project_status_money_rd(projects)
    projects_array = ""
    projects_array << "#{projects.canceled.estimation_sum},"
    projects_array << "#{projects.potential.estimation_sum},"
    projects_array << "#{projects.operation.estimation_sum},"
    projects_array << "#{projects.delivered.estimation_sum}"
    projects_array
  end
  
  def employees_names(employees)
    employees.map(&:name).join(",")
  end
  
  def employees_bp(employees)
    comma_separated = []
    employees.each do |employee|
      comma_separated << employee.all_unique_business_planning_projects.count
    end
    comma_separated.join(",")
  end
  
  def employees_bp_money(employees)
    comma_separated = []
    employees.each do |employee|
      comma_separated << employee.project_estimation_sum(:all_unique_business_planning_projects)
    end
    comma_separated.join(",")
  end
  
  def employees_gd(employees)
    comma_separated = []
    employees.each do |employee|
      comma_separated << employee.all_unique_graphic_design_projects.count
    end
    comma_separated.join(",")
  end
  
  def employees_gd_money(employees)
    comma_separated = []
    employees.each do |employee|
      comma_separated << employee.project_estimation_sum(:all_unique_graphic_design_projects)
    end
    comma_separated.join(",")
  end
  
  def employees_id(employees)
    comma_separated = []
    employees.each do |employee|
      comma_separated << employee.all_unique_industrial_design_projects.count
    end
    comma_separated.join(",")
  end
  
  def employees_id_money(employees)
    comma_separated = []
    employees.each do |employee|
      comma_separated << employee.project_estimation_sum(:all_unique_industrial_design_projects)
    end
    comma_separated.join(",")
  end
  
  def employees_software(employees)
    comma_separated = []
    employees.each do |employee|
      comma_separated << employee.all_unique_software_projects.count
    end
    comma_separated.join(",")
  end
  
  def employees_software_money(employees)
    comma_separated = []
    employees.each do |employee|
      comma_separated << employee.project_estimation_sum(:all_unique_software_projects)
    end
    comma_separated.join(",")
  end
  
  def employees_rd(employees)
    comma_separated = []
    employees.each do |employee|
      comma_separated << employee.all_unique_r_and_d_projects.count
    end
    comma_separated.join(",")
  end
  
  def employees_rd_money(employees)
    comma_separated = []
    employees.each do |employee|
      comma_separated << employee.project_estimation_sum(:all_unique_r_and_d_projects)
    end
    comma_separated.join(",")
  end
  
  def employees_internal(employees)
    comma_separated = []
    employees.each do |employee|
      comma_separated << employee.all_unique_internal_projects.count
    end
    comma_separated.join(",")
  end

end

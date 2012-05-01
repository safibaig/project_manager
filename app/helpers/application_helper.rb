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
  
end

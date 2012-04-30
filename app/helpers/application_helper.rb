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
  
end

module ApplicationHelper
  
  def title
    base_title = "Project Manager :: Invomex"
  end
  
  def admin_area(&block)
    capture(&block) if user_signed_in?
  end
  
end

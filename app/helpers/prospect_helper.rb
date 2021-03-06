module ProspectHelper
  
  def render_color(status)
    color = case status
    when 0 then "red"
    when 1 then "orange"
    when 2 then "yellow"
    when 3 then "green"
    when 4 then "blue"
    end
  end
  
  def render_string_status(status)
    title = case status
      when 0 then 'Canceled'
      when 1 then 'Added'
      when 2 then 'Contacted'
      when 3 then 'Meeting'
      when 4 then 'Client'
    end
  end
  
end

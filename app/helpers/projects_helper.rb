module ProjectsHelper
  
  def data_client
    unless @project.client.nil?
       attributes = {}
       array = []
       attributes[:id] = @project.client.id
       attributes[:company_name] = @project.client.company_name
       array << attributes
       array.to_json
     end
   end
   
   def data_business_unit
    unless @project.business_unit.nil?
      attributes = {}
      array = []
      attributes[:id] = @project.business_unit.id
      attributes[:name] = @project.business_unit.name
      array << attributes
      array.to_json
    end
   end
   
   def data_sales_rep
    unless @project.user.nil? 
     attributes = {}
     array = []
     attributes[:id] = @project.user.id
     attributes[:name] = @project.user.name
     array << attributes
     array.to_json
    end
   end
   
   def data_pm
    unless @project.user.nil?
     attributes = {}
     array = []
     attributes[:id] = @project.user.id
     attributes[:name] = @project.user.name
     array << attributes
     array.to_json
    end
   end
   
   def string_status(status)
     title = case status
       when 0 then 'Canceled'
       when 1 then 'QuickLook'
       when 2 then 'Proposal Development'
       when 3 then 'Proposal Delivered'
       when 4 then 'On Operation'
       when 5 then 'Delivered & Paid'
     end
   end
  
end

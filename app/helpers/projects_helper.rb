module ProjectsHelper
  
  def data_client(client)
       attributes = {}
       array = []
       attributes[:id] = client.id
       attributes[:company_name] = client.company_name
       array << attributes
       array.to_json
   end
   
   def data_business_unit(business_unit)
      attributes = {}
      array = []
      attributes[:id] = business_unit.id
      attributes[:name] = business_unit.name
      array << attributes
      array.to_json
   end
   
   def data_sales_rep(user)
     attributes = {}
     array = []
     attributes[:id] = user.id
     attributes[:name] = user.name
     array << attributes
     array.to_json
   end
   
   def data_pm(user)
     attributes = {}
     array = []
     attributes[:id] = user.id
     attributes[:name] = user.name
     array << attributes
     array.to_json
   end
  
end

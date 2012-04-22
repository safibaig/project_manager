class Prospect < Client
  
  scope :all, where(:type => "Prospect")
  
end

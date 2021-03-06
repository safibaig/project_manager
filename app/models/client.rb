# == Schema Information
#
# Table name: clients
#
#  id            :integer         not null, primary key
#  business_type :string(255)
#  interests     :string(255)
#  company_name  :string(255)
#  contact_name  :string(255)
#  phone         :string(255)
#  mobile        :string(255)
#  email         :string(255)
#  website       :string(255)
#  address       :text
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

class Client < ActiveRecord::Base
  has_many :projects
  has_many :interests
  has_many :business_units, :through => :interests
  has_many :comments, :as => :commentable
  attr_reader :business_unit_tokens
  
  attr_accessible :business_type, :company_name, :contact_name,
                  :phone, :mobile, :email, :website, :business_unit_tokens, :image,
                  :street, :city, :state, :country
  
  validates :company_name, 
            :contact_name, :phone, :email,
            :presence => true 
          
  scope :interested_in_software, lambda {
    joins(:business_units).where("business_units.name = 'Software'")
  }
  
  scope :interested_in_graphic_design, lambda {
    joins(:business_units).where("business_units.name = 'Graphic Design'")
  }
  
  scope :interested_in_industrial_design, lambda {
    joins(:business_units).where("business_units.name = 'Industrial Design'")
  }
  
  scope :interested_in_business_planning, lambda {
    joins(:business_units).where("business_units.name = 'Business Planning'")
  }
  
  scope :interested_in_research_and_development, lambda {
    joins(:business_units).where("business_units.name = 'R&D'")
  }
  
  scope :by_date_range, lambda { |from, to| where("created_at >= ? AND created_at <= ?", "#{from} 00:00:00", "#{to} 23:59:59")}
  
  paginates_per 50
  
  mount_uploader :image, ImageUploader
            
  def to_s
    self.company_name.capitalize
  end
  
  def business_unit_tokens=(ids)
    self.business_unit_ids = ids.split(",")
  end
  
  def business_unit_interests
    self.business_units.map(&:name)
  end
  
  def self.search(params={})
    if params[:search].present?
      where("company_name #{LIKE} ?", "%#{params[:search]}%").page(params[:page])
    else
      where("company_name #{LIKE} ?", "%#{params[:q]}%").page(params[:page])
    end
  end
  
  def address
     "#{self.street}, #{self.city} #{self.state}"
   end
  
end

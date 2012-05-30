# == Schema Information
#
# Table name: prospects
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

class Prospect < ActiveRecord::Base
  
  has_many :interests
  has_many :business_units, :through => :interests
  has_many :comments, :as => :commentable
  belongs_to :user
  attr_reader :business_unit_tokens
  
  validates :business_type, :company_name, :status,
            :contact_name, :phone, :email,
            :presence => true
  
  attr_accessible :business_type, :company_name, :contact_name, :status,
                  :phone, :mobile, :email, :website, :address, :business_unit_tokens,
                  :company_size
  
  STATUS = [["0 - Canceled", 0],
            ["1 - Added", 1],
            ["2 - Contacted", 2],
            ["3 - Meeting", 3],
            ["4 - Client", 4]]
  
  COMPANY_SIZE = [["Startup","Startup"],
                  ["PyMe", "PyMe"],
                  ["Grande", "Grande"]]
            
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
    joins(:business_units).where("business_units.name = 'Research and Development'")
  }
  
  scope :by_date_range, lambda { |from, to| where("created_at >= ? AND created_at <= ?", "#{from} 00:00:00", "#{to} 23:59:59")}
  
  def business_unit_tokens=(ids)
    self.business_unit_ids = ids.split(",")
  end
  
  def business_unit_interests
    self.business_units.map(&:name)
  end
  
  def self.search(params={})
    if params[:search].present?
      where("company_name #{LIKE} ?", "%#{params[:search]}%")
    else
      all
    end
  end
  
  def self.find_by_status(status)
    where(:status => status)
  end
  
end

# == Schema Information
#
# Table name: projects
#
#  id               :integer         not null, primary key
#  name             :string(255)
#  client_id        :integer
#  user_id          :integer
#  business_unit_id :string(255)
#  project_manager  :string(255)
#  real_status      :integer
#  ideal_status     :integer
#  lead_source      :string(255)
#  estimation       :decimal(, )
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

class Project < ActiveRecord::Base
  
  belongs_to :client
  belongs_to :business_unit
  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :employments
  has_many :suppliers, :through => :employments
  
  attr_reader :supplier_tokens
  
  validates :name, :project_manager, :status, :kind,
            :lead_source, :estimation, :presence => true
  
  validates :estimation, :status, :numericality => true
  
  scope :internal, lambda {
    where(:kind => "Internal")
  }
  
  scope :external, lambda {
    where(:kind => "External")
  }
  
  scope :recent, lambda {
    order("created_at DESC").limit(5)
  }
  
  scope :by_date_range, lambda { |from, to| where("created_at >= ? AND created_at <= ?", "#{from} 00:00:00", "#{to} 23:59:59")}
  
  KINDS = [["Internal", "Internal"],
           ["External", "External"]]
  
  LEAD_SOURCES = [["Website", "Website"],
                  ["Facebook", "Facebook"],
                  ["Twitter", "Twitter"],
                  ["Linkedin", "Linkedin"],
                  ["Innovation magazine", "Innovation magazine"],
                  ["YouTube", "YouTube"],
                  ["Email", "Email"],
                  ["Recommendation", "Recommendation"],
                  ["Employees", "Employees"],
                  ["Innovative Lab", "Innovative Lab"],
                  ["Phone", "Phone"]]
  
  def supplier_tokens=(ids)
    self.supplier_ids = ids.split(",")
  end
  
  def self.search(params={})
    if params[:search].present?
      where("name #{LIKE} ?", "%#{params[:search]}%")
    else
      all
    end
  end
  
end

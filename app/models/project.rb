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
  has_many :archives
  has_many :assignments
  has_many :employees, :through => :assignments, :source => :user
  belongs_to :project_manager, :class_name => "User", :foreign_key => "project_manager_id"
  
  attr_reader :supplier_tokens, :employee_tokens
  
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
  
  scope :graphic_design, lambda {
    where(:business_unit_id => 1)
  }
  
  scope :software, lambda {
    where(:business_unit_id => 2)
  }
  
  scope :industrial_design, lambda {
    where(:business_unit_id => 3)
  }
  
  scope :business_planning, lambda {
    where(:business_unit_id => 4)
  }
  
  scope :research_and_development, lambda {
    where(:business_unit_id => 5)
  }
  
  scope :canceled, lambda {
    where(:status => 0)
  }
  
  scope :quick_look, lambda {
    where(:status => 1)
  }
  
  scope :proposal_development, lambda {
    where(:status => 2)
  }
  
  scope :proposal_delivered, lambda {
    where(:status => 3)
  }
  
  scope :operation, lambda {
    where(:status => 4)
  }
  
  scope :delivered, lambda {
    where(:status => 5)
  }
  
  scope :potential, lambda {
    where("status = ? OR status = ? OR status = ?", "1", "2", "3")
  }
  
  scope :running, lambda {
    where("status = ? OR status = ? OR status = ? OR status = ?", "1", "2", "3", "4")
  }
  
  scope :source, lambda { |source| where(:lead_source => source)}
  
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
  
  STATUS = [["0 - Canceled", 0],
            ["1 - QuickLook", 1],
            ["2 - Proposal Development", 2],
            ["3 - Proposal Delivered", 3],
            ["4 - On Operation", 4],
            ["5 - Delivered & Paid", 5]]
  
  paginates_per 50
  
  mount_uploader :image, ImageUploader
  
  def supplier_tokens=(ids)
    self.supplier_ids = ids.split(",")
  end
  
  def employee_tokens=(ids)
    self.employee_ids = ids.split(",")
  end
  
  def self.search(params={})
    if params[:user_id].present?
      user = User.find(params[:user_id])
      Kaminari.paginate_array(user.all_projects).page(params[:page])
    elsif params[:search].present?
      where("name #{LIKE} ?", "%#{params[:search]}%").page(params[:page])
    else
      page(params[:page])
    end
  end
  
end

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
  
  def self.search(params={})
    if params[:user_id].present?
      where("name #{LIKE} ? AND user_id = ?", "%#{params[:search]}%", "#{params[:user_id]}").page(params[:page])
    elsif params[:search].present?
      where("name #{LIKE} ?", "%#{params[:search]}%").page(params[:page])
    else
      page(params[:page])
    end
  end
  
end

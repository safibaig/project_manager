# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  name                   :string(255)     default(""), not null
#  last_name              :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :projects
  has_many :comments, :as => :commentable
  has_one :prospect
  has_many :assignments
  has_many :assigned_projects, :through => :assignments, :source => :project
  has_many :managing_projects, :class_name => "Project", :source => :project, :foreign_key => "project_manager_id"
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, 
                  :last_name, :rol, :gender, :image, :job_title, :degree, :phone,
                  :street, :city, :state, :country, :status, :employee_since
  
  validates :name, :last_name, :rol, :presence => true
  
  paginates_per 50
  
  scope :employees, lambda { 
    where(:rol => "Employee")
  }
  
  scope :male, lambda {
    where(:gender => "Male")
  }
  
  scope :female, lambda {
    where(:gender => "Female")
  }
  
  GENDERS = [["Male", "Male"],
             ["Female", "Female"]]
             
  mount_uploader :image, ImageUploader
  
  def to_s
    "#{self.name} #{self.last_name}".titleize
  end
  
  def self.find_by_params(q)
    if q.blank?
      all
    else
      where("name #{LIKE} ?", "%#{q}%")
    end 
  end
  
  def self.search(params)
    if params[:search].present?
      where("name #{LIKE} ?", "%#{params[:search]}%").page(params[:page])
    else
      page(params[:page])
    end
  end
  
  def self.find_by_status(status)
    where(:status => status)
  end
  
  def status_to_s
    if status == 1
      "Active"
    else
      "Inactive"
    end
  end
  
  def project_estimation_sum(method)
    self.send(method).map(&:estimation).inject(:+) || 0
  end
  
  def address
     "#{self.street}, #{self.city} #{self.state}"
  end
  
  def all_projects
    (self.projects + self.assigned_projects + self.managing_projects).uniq
  end

  def all_projects_estimation
    self.all_projects.map(&:estimation).inject(:+).to_f || 0.0
  end
  
  def all_unique_business_planning_projects
    (self.rsend(:assigned_projects, :business_planning, :running) +
    self.rsend(:projects, :business_planning, :running) + 
    self.rsend(:managing_projects, :business_planning, :running)).uniq
  end
  
  def all_unique_graphic_design_projects
    (self.rsend(:assigned_projects, :graphic_design, :running) +
    self.rsend(:projects, :graphic_design, :running) + 
    self.rsend(:managing_projects, :graphic_design, :running)).uniq
  end
  
  def all_unique_industrial_design_projects
    (self.rsend(:assigned_projects, :industrial_design, :running) +
    self.rsend(:projects, :industrial_design, :running) + 
    self.rsend(:managing_projects, :industrial_design, :running)).uniq
  end
  
  def all_unique_software_projects
    (self.rsend(:assigned_projects, :software, :running) +
    self.rsend(:projects, :software, :running) + 
    self.rsend(:managing_projects, :software, :running)).uniq
  end
  
  def all_unique_r_and_d_projects
    (self.rsend(:assigned_projects, :research_and_development, :running) +
    self.rsend(:projects, :research_and_development, :running) + 
    self.rsend(:managing_projects, :research_and_development, :running)).uniq
  end
  
  def all_unique_internal_projects
    (self.rsend(:assigned_projects, :internal, :running) +
    self.rsend(:projects, :internal, :running) + 
    self.rsend(:managing_projects, :internal, :running)).uniq
  end

  def rsend(*args, &block)
    obj = self
    args.each do |a|
      b = (a.is_a?(Array) && a.last.is_a?(Proc) ? a.pop : block)
      obj = obj.__send__(*a, &b)
    end
    obj
  end
  alias_method :__rsend__, :rsend
  
end

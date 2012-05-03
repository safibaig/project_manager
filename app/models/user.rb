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
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :last_name, :rol
  
  validates :name, :last_name, :rol, :presence => true
  
  scope :employees, lambda { 
      where(:rol => "Employee")
  }
  
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
      where("name #{LIKE} ?", "%#{params[:search]}%").employees
    else
      employees
    end
  end
  
  def self.find_by_status(status)
    where(:status => status)
  end
end

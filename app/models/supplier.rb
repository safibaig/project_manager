# == Schema Information
#
# Table name: suppliers
#
#  id            :integer         not null, primary key
#  company_name  :string(255)
#  contact_name  :string(255)
#  business_type :string(255)
#  address       :text
#  phone         :string(255)
#  email         :string(255)
#  bank_account  :string(255)
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

class Supplier < ActiveRecord::Base
  
  has_many :sellings
  has_many :business_units, :through => :sellings
  has_many :comments, :as => :commentable
  attr_reader :business_unit_tokens
  has_many :employments
  has_many :projects, :through => :employments
  
  attr_accessible :company_name, :contact_name, :business_unit_tokens,
                  :address, :phone, :email, :bank_account, :image
  
  validates :company_name, :contact_name,
            :address, :phone, :email, :bank_account, :presence => true

  mount_uploader :image, ImageUploader

  def business_unit_tokens=(ids)
    self.business_unit_ids = ids.split(",")
  end

  def business_unit_sellings
    self.business_units.map(&:name)
  end
  
  def self.find_by_params(params={})
    if params[:search].present?
      where("company_name #{LIKE} ?", "%#{params[:search]}%")
    else
      all
    end
  end

end

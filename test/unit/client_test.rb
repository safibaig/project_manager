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

require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

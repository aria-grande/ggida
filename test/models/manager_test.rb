# == Schema Information
#
# Table name: managers
#
#  id                 :integer          not null, primary key
#  username           :string(255)      default(""), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  email              :string(255)      default(""), not null
#  encrypted_password :string(255)      default(""), not null
#  sign_in_count      :integer          default(0), not null
#  current_sign_in_at :datetime
#  last_sign_in_at    :datetime
#  current_sign_in_ip :string(255)
#  last_sign_in_ip    :string(255)
#

require 'test_helper'

class ManagerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: participants
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  email      :string(255)      not null
#  phone      :string(255)      not null
#  party_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Participant < ApplicationRecord
  belongs_to :party
end

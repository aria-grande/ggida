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
#  state      :integer          default("init")
#

class Participant < ApplicationRecord
  belongs_to :party

  enum state: {
      init: 0, # 초기 상태(승인 대기 중)
      accepted: 1, # 모집중
      rejected: 2 # 모집 완료
  }
end

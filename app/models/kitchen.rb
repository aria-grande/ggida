# == Schema Information
#
# Table name: kitchens
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  address      :string(255)
#  phone        :string(255)
#  email        :string(255)
#  maxPerson    :integer
#  spaceType    :integer
#  equipment    :string(255)
#  opening_time :string(255)
#  closed_time  :string(255)
#  fare         :string(255)
#  etc          :string(255)
#  notice       :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  latitute     :float(53)        default(0.0)
#  longitute    :float(53)        default(0.0)
#

class Kitchen < ApplicationRecord

  validates :name, :address, :phone, :email, presence: true

  enum spaceType: {
      # TODO: fill
  }
end

# == Schema Information
#
# Table name: scopes
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Scope < ApplicationRecord
  has_many :scopings
  has_many :jobs, through: :scopings

  validates :name, presence: true
end

# == Schema Information
#
# Table name: companies
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  size        :integer
#  website     :text
#  status      :integer          default("pending")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Company < ApplicationRecord
  has_one :address

  validates :name, :description, :size, :website, presence: true

  enum status: [:pending, :rejected, :approved]
end

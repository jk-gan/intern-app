# == Schema Information
#
# Table name: addresses
#
#  id             :integer          not null, primary key
#  company_id     :integer
#  street_address :text
#  city           :string
#  state          :string
#  country        :string
#  postcode       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_addresses_on_company_id  (company_id)
#

class Address < ApplicationRecord
  belongs_to :company, optional: true

  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :postcode, presence: true, length: { is: 5 }
end

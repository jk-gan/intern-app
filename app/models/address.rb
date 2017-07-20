# == Schema Information
#
# Table name: addresses
#
#  id             :integer          not null, primary key
#  company_id     :integer
#  street_address :text(65535)
#  city           :string(255)
#  state          :string(255)
#  country        :string(255)
#  postcode       :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_addresses_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#

class Address < ApplicationRecord
  belongs_to :company, optional: true

  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :postcode, presence: true, length: { is: 5 }
end

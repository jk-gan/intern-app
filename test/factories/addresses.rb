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

FactoryGirl.define do
  factory :address do
    company
    street_address "1, Jalan ABCD"
    city "City"
    state "State"
    country "Malaysia"
    postcode "82345"
  end
end

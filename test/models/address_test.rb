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

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  setup do
    @company = create(:company)
  end

  test "should be invalid without street_address" do
    address = build(:address, street_address: nil)
    assert_nil address.street_address
    assert_not address.valid?
  end

  test "should be invalid without city" do
    address = build(:address, city: nil)
    assert_nil address.city
    assert_not address.valid?
  end

  test "should be invalid without state" do
    address = build(:address, state: nil)
    assert_nil address.state
    assert_not address.valid?
  end

  test "should be invalid without country" do
    address = build(:address, country: nil)
    assert_nil address.country
    assert_not address.valid?
  end

  test "should be invalid without postcode" do
    address = build(:address, postcode: nil)
    assert_nil address.postcode
    assert_not address.valid?
  end

  test "should be invalid if postcode length more than 5" do
    address = build(:address, postcode: '123456')
    assert_equal true, address.postcode.length > 5
    assert_not address.valid?
  end
end

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

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # constant tests go here

  # associations tests go here
  should belong_to :company

  # validations tests go here
  should validate_presence_of :street_address
  should validate_presence_of :city
  should validate_presence_of :state
  should validate_presence_of :country
  should validate_presence_of :postcode
  should validate_length_of(:postcode).is_equal_to(5)

  # scope tests go here

  # class method tests go here

  # instance method tests go here

end

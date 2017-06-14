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

require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # constant tests go here

  # associations tests go here
  should have_one :address
  should have_many :taggings
  should have_many(:tags).through(:taggings)

  # validations tests go here
  should validate_presence_of :name
  should validate_presence_of :description
  should validate_presence_of :size
  should validate_presence_of :website
  should define_enum_for(:status).with([:pending, :rejected, :approved])

  # scope tests go here

  # class method tests go here

  # instance method tests go here

end

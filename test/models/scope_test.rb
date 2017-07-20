# == Schema Information
#
# Table name: scopes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ScopeTest < ActiveSupport::TestCase
  # constant tests go here

  # associations tests go here
  should have_many :scopings
  should have_many(:jobs).through(:scopings)

  # validations tests go here
  should validate_presence_of :name

  # scope tests go here

  # class method tests go here

  # instance method tests go here

end

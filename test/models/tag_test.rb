# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TagTest < ActiveSupport::TestCase
  # constant tests go here

  # associations tests go here
  should have_many :taggings
  should have_many(:companies).through(:taggings)

  # validations tests go here
  should validate_presence_of :name

  # scope tests go here

  # class method tests go here

  # instance method tests go here

end

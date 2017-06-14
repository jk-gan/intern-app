# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TagTest < ActiveSupport::TestCase
  test "should be invalid without name" do
    tag = build(:tag, name: nil)
    assert_nil tag.name
    assert_not tag.valid?
  end
end

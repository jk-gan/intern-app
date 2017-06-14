# == Schema Information
#
# Table name: taggings
#
#  id         :integer          not null, primary key
#  company_id :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_taggings_on_company_id  (company_id)
#  index_taggings_on_tag_id      (tag_id)
#

require 'test_helper'

class TaggingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

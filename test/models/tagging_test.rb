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
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (tag_id => tags.id)
#

require 'test_helper'

class TaggingTest < ActiveSupport::TestCase
  # constant tests go here

  # associations tests go here
  should belong_to :company
  should belong_to :tag

  # validations tests go here

  # scope tests go here

  # class method tests go here

  # instance method tests go here

end

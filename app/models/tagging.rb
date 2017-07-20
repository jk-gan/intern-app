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

class Tagging < ApplicationRecord
  belongs_to :company
  belongs_to :tag
end

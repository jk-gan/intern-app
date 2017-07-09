# == Schema Information
#
# Table name: scopings
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  scope_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_scopings_on_job_id    (job_id)
#  index_scopings_on_scope_id  (scope_id)
#

class Scoping < ApplicationRecord
  belongs_to :job
  belongs_to :scope
end

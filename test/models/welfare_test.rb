# == Schema Information
#
# Table name: welfares
#
#  id               :integer          not null, primary key
#  job_id           :integer
#  training         :boolean
#  training_detail  :text
#  accomodation     :boolean
#  free_food        :boolean
#  free_food_detail :text
#  other_benefits   :text
#  allowance        :decimal(8, 2)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_welfares_on_job_id  (job_id)
#

require 'test_helper'

class WelfareTest < ActiveSupport::TestCase
  # constant tests go here

  # associations tests go here
  should belong_to :job

  # validations tests go here
  subject { Welfare.new(training: true) }
  should validate_presence_of :training_detail

  # scope tests go here

  # class method tests go here

  # instance method tests go here

end

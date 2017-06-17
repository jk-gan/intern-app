# == Schema Information
#
# Table name: jobs
#
#  id            :integer          not null, primary key
#  company_id    :integer
#  name          :string
#  description   :text
#  working_hours :float
#  dress_code    :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_jobs_on_company_id  (company_id)
#

require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # constant tests go here

  # associations tests go here
  should belong_to :company

  # validations tests go here
  should validate_presence_of :name
  should validate_presence_of :description
  should validate_presence_of :working_hours
  should validate_numericality_of(:working_hours).is_greater_than(0)
  should validate_presence_of :dress_code

  # scope tests go here

  # class method tests go here

  # instance method tests go here

end

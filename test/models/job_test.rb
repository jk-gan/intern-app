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
  setup do
    @job = jobs(:rails)
  end

  # constant tests go here

  # associations tests go here
  should belong_to :company
  should have_many :scopings
  should have_many(:scopes).through(:scopings)
  should have_one(:welfare).dependent(:destroy)
  should accept_nested_attributes_for(:welfare).allow_destroy(true)

  # validations tests go here
  should validate_presence_of :name
  should validate_presence_of :description
  should validate_presence_of :working_hours
  should validate_numericality_of(:working_hours).is_greater_than(0)
  should validate_presence_of :dress_code

  # scope tests go here

  # class method tests go here
  test "scoped_with should return a list of jobs" do
    jobs_scoped_with_tech = Job.scoped_with('code')
    assert_equal 2, jobs_scoped_with_tech.length

    jobs_scoped_with_rails = Job.scoped_with('rails')
    assert_equal 1, jobs_scoped_with_rails.length
    assert_equal 'rails developer', jobs_scoped_with_rails.first.name

    jobs_scoped_with_php = Job.scoped_with('php')
    assert_equal 1, jobs_scoped_with_php.length
    assert_equal 'php developer', jobs_scoped_with_php.first.name
  end

  # instance method tests go here
  test "all_scopes= should create scopes" do
    @job.all_scopes = 'a, b, c'
    assert_equal Scope.find_by(name: 'a').scopings.first.job_id, @job.id
  end

  test "all_scopes should return the scopes of the jobs" do
    scopes = @job.all_scopes
    assert_equal "rails, code", scopes
  end

end

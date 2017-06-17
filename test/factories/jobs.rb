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

FactoryGirl.define do
  factory :job do
    company nil
    name "MyString"
    description "MyText"
    working_hour 1.5
    dress_code "MyString"
  end
end

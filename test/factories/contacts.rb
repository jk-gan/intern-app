# == Schema Information
#
# Table name: contacts
#
#  id                  :integer          not null, primary key
#  company_id          :integer
#  name                :string
#  role                :string
#  contact_number      :string
#  email               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#
# Indexes
#
#  index_contacts_on_company_id  (company_id)
#

FactoryGirl.define do
  factory :contact do
    company nil
    name "MyString"
    role "MyString"
    contact_number "MyString"
    email "MyString"
  end
end

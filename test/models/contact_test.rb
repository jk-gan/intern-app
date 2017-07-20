# == Schema Information
#
# Table name: contacts
#
#  id                  :integer          not null, primary key
#  company_id          :integer
#  name                :string(255)
#  role                :string(255)
#  contact_number      :string(255)
#  email               :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#
# Indexes
#
#  index_contacts_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#

require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  # constant tests go here

  # associations tests go here
  should belong_to :company

  # validations tests go here
  should validate_presence_of :name
  should validate_presence_of :email
  should validate_presence_of :role

  # scope tests go here

  # class method tests go here

  # instance method tests go here
end

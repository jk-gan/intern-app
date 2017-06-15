# == Schema Information
#
# Table name: contacts
#
#  id             :integer          not null, primary key
#  company_id     :integer
#  name           :string
#  role           :string
#  contact_number :string
#  email          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_contacts_on_company_id  (company_id)
#

class Contact < ApplicationRecord
  belongs_to :company

  validates :name, presence: true
  validates :role, presence: true
	validates :email, presence: true
end

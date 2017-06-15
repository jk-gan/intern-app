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
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
end

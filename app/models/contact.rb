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

class Contact < ApplicationRecord
  belongs_to :company

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "missing/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates :name, presence: true
  validates :role, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

end

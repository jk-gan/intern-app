# == Schema Information
#
# Table name: profiles
#
#  id                  :integer          not null, primary key
#  first_name          :string
#  last_name           :string
#  university          :string
#  course              :string
#  phone               :string
#  user_id             :integer
#  gender              :integer          default("Male")
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  resume_file_name    :string
#  resume_content_type :string
#  resume_file_size    :integer
#  resume_updated_at   :datetime
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#

class Profile < ApplicationRecord
  belongs_to :user

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "missing/missing.png"
  has_attached_file :resume

  validates_attachment :avatar, content_type: { content_type: /\Aimage\/.*\z/ }
  validates_attachment :resume, content_type: { content_type: "application/pdf" }

  enum gender: [ :Male, :Female ]
end

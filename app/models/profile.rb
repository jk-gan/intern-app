# == Schema Information
#
# Table name: profiles
#
#  id                  :integer          not null, primary key
#  first_name          :string(255)
#  last_name           :string(255)
#  university          :string(255)
#  course              :string(255)
#  phone               :string(255)
#  user_id             :integer
#  gender              :integer          default("Male")
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  resume_file_name    :string(255)
#  resume_content_type :string(255)
#  resume_file_size    :integer
#  resume_updated_at   :datetime
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Profile < ApplicationRecord
  belongs_to :user

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "missing/missing.png"
  has_attached_file :resume

  validates_attachment :avatar, content_type: { content_type: /\Aimage\/.*\z/ }
  validates_attachment :resume, content_type: { content_type: "application/pdf" }

  enum gender: [ :Male, :Female ]
end

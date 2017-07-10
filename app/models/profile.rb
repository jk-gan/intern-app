# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  university :string
#  course     :string
#  phone      :string
#  user_id    :integer
#  gender     :integer          default("Male")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#

class Profile < ApplicationRecord
  belongs_to :user

  enum gender: [ :Male, :Female ]
end

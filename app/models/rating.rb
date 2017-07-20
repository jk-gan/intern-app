# == Schema Information
#
# Table name: ratings
#
#  id                    :integer          not null, primary key
#  user_id               :integer
#  company_id            :integer
#  culture_score         :float            default(0.0)
#  environment_score     :float            default(0.0)
#  cleanliness_score     :float            default(0.0)
#  location_score        :float            default(0.0)
#  learning_score        :float            default(0.0)
#  management_score      :float            default(0.0)
#  new_culture_score     :boolean          default(TRUE)
#  new_environment_score :boolean          default(TRUE)
#  new_cleanliness_score :boolean          default(TRUE)
#  new_location_score    :boolean          default(TRUE)
#  new_learning_score    :boolean          default(TRUE)
#  new_management_score  :boolean          default(TRUE)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  empty                 :boolean          default(TRUE)
#
# Indexes
#
#  index_ratings_on_company_id  (company_id)
#  index_ratings_on_user_id     (user_id)
#

class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :company

  scope :not_empty, -> { where(empty: false) }
end

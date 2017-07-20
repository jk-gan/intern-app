# == Schema Information
#
# Table name: ratings
#
#  id                    :integer          not null, primary key
#  user_id               :integer
#  company_id            :integer
#  culture_score         :float(24)        default(0.0)
#  environment_score     :float(24)        default(0.0)
#  cleanliness_score     :float(24)        default(0.0)
#  location_score        :float(24)        default(0.0)
#  learning_score        :float(24)        default(0.0)
#  management_score      :float(24)        default(0.0)
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
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

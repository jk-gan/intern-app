# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  body       :text(65535)
#  rating_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_reviews_on_rating_id  (rating_id)
#
# Foreign Keys
#
#  fk_rails_...  (rating_id => ratings.id)
#

class Review < ApplicationRecord
  belongs_to :rating
end

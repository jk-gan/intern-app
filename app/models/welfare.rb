# == Schema Information
#
# Table name: welfares
#
#  id               :integer          not null, primary key
#  job_id           :integer
#  training         :boolean
#  training_detail  :text
#  accomodation     :boolean
#  free_food        :boolean
#  free_food_detail :text
#  other_benefits   :text
#  allowance        :decimal(8, 2)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_welfares_on_job_id  (job_id)
#

class Welfare < ApplicationRecord
  belongs_to :job

  validates :training_detail, presence: true, if: :has_training?
  validates :free_food_detail, presence: true, if: :has_free_food?

  def has_training?
    training
  end

  def has_free_food?
    free_food
  end

  def has_accomodation?
    accomodation
  end
end

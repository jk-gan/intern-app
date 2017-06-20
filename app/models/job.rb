# == Schema Information
#
# Table name: jobs
#
#  id            :integer          not null, primary key
#  company_id    :integer
#  name          :string
#  description   :text
#  working_hours :float
#  dress_code    :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_jobs_on_company_id  (company_id)
#

class Job < ApplicationRecord
  belongs_to :company
  has_one :welfare, dependent: :destroy
  accepts_nested_attributes_for :welfare, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
  validates :description, presence: true
  validates :working_hours, presence: true, numericality: { greater_than: 0 }
  validates :dress_code, presence: true
end

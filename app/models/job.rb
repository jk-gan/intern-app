# == Schema Information
#
# Table name: jobs
#
#  id            :integer          not null, primary key
#  company_id    :integer
#  name          :string(255)
#  description   :text(65535)
#  working_hours :float(24)
#  dress_code    :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_jobs_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#

class Job < ApplicationRecord
  belongs_to :company
  has_many :scopings
  has_many :scopes, through: :scopings
  has_one :welfare, dependent: :destroy
  accepts_nested_attributes_for :welfare, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
  validates :description, presence: true
  validates :working_hours, presence: true, numericality: { greater_than: 0 }
  validates :dress_code, presence: true

  def all_scopes=(names)
    self.scopes = names.split(",").map do |name|
      Scope.where(name: name.strip).first_or_create!
    end
  end

  def all_scopes
    self.scopes.map(&:name).join(", ")
  end

  def self.scoped_with(name)
    Scope.find_by_name!(name).jobs
  end
end

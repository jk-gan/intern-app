# == Schema Information
#
# Table name: companies
#
#  id                :integer          not null, primary key
#  name              :string
#  description       :text
#  size              :integer
#  website           :text
#  status            :integer          default("pending")
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  logo_file_name    :string
#  logo_content_type :string
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#

class Company < ApplicationRecord
  has_one :address
  has_many :taggings
	has_many :tags, through: :taggings
  has_one :contact, dependent: :destroy
  has_many :jobs, dependent: :destroy
  has_many :ratings

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "150x150>" }, default_url: "missing/missing.png"
	validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  validates :name, presence: true, length: { minimum: 2 }
  validates :description, presence: true
	validates :website, presence: true
  validates :size, presence: true
  validates :status, inclusion: { in: %w(pending rejected approved), message: "%{value} is not a valid status" }

  accepts_nested_attributes_for :address, reject_if: :all_blank

  enum status: [:pending, :rejected, :approved]

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).companies
  end

  def average_rating
    # sum = ratings.sum { |rate| rate.culture_score + rate.environment_score + rate.cleanliness_score + rate.location_score + rate.learning_score + rate.management_score }
    # sum / (ratings.size * 6)
    sum = average_culture_rating + average_environment_rating + average_cleanliness_rating + average_location_rating + average_learning_rating + average_management_rating
    sum / 6
  end

  def average_culture_rating
    ratings.where(new_culture_score: false).average(:culture_score) || 0
  end

  def average_environment_rating
    ratings.where(new_environment_score: false).average(:environment_score) || 0
  end

  def average_cleanliness_rating
    ratings.where(new_cleanliness_score: false).average(:cleanliness_score) || 0
  end

  def average_location_rating
    ratings.where(new_location_score: false).average(:location_score) || 0
  end

  def average_learning_rating
    ratings.where(new_learning_score: false).average(:learning_score) || 0
  end

  def average_management_rating
    ratings.where(new_management_score: false).average(:management_score) || 0
  end
end

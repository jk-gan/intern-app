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
end

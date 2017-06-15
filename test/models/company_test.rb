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

require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  setup do
    @company1 = create(:company, name: "Apple", all_tags: "tech, apple")
    @company2 = create(:company, name: "Google", all_tags: "tech, google")
  end

  # constant tests go here

  # associations tests go here
  should have_one :address
  should have_many :taggings
  should have_many(:tags).through(:taggings)
  should have_one(:contact).dependent(:destroy)
  should accept_nested_attributes_for(:address)

  # validations tests go here
  should validate_presence_of :name
  should validate_length_of(:name).is_at_least(2).on(:create)
  should validate_presence_of :description
  should validate_presence_of :size
  should validate_presence_of :website
  should define_enum_for(:status).with([:pending, :rejected, :approved])

  # scope tests go here

  # class method tests go here
  test "tagged_with should return a list of companies" do
    companies_tagged_with_tech = Company.tagged_with('tech')
    assert_equal 2, companies_tagged_with_tech.length

    companies_tagged_with_google = Company.tagged_with('google')
    assert_equal 1, companies_tagged_with_google.length
    assert_equal 'Google', companies_tagged_with_google.first.name

    companies_tagged_with_apple = Company.tagged_with('apple')
    assert_equal 1, companies_tagged_with_apple.length
    assert_equal 'Apple', companies_tagged_with_apple.first.name
  end

  # instance method tests go here
  test "all_tags= should create tags" do
    company = create(:company, all_tags: 'a, b, c')
    assert_equal Tag.find_by(name: 'a').taggings.first.company_id, company.id
  end

  test "all_tags should return the tags of the companies" do
    tags = @company1.all_tags
    assert_equal "tech, apple", tags
  end
end

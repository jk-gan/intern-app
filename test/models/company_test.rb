# == Schema Information
#
# Table name: companies
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  size        :integer
#  website     :text
#  status      :integer          default("pending")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @status = [:pending, :rejected, :approved]
  end

  test "should be invalid without name" do
    company = build(:company, name: nil)
    assert_nil company.name
    assert_not company.valid?
  end

  test "should be invalid without description" do
    company = build(:company, description: nil)
    assert_nil company.description
    assert_not company.valid?
  end

  test "should be invalid without size" do
    company = build(:company, size: nil)
    assert_nil company.size
    assert_not company.valid?
  end

  test "should be invalid without website" do
    company = build(:company, website: nil)
    assert_nil company.website
    assert_not company.valid?
  end

  test "status should be in right index" do
    @status.each_with_index do |item, index|
      assert_equal Company.statuses[item], index
    end
  end
end

require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "GET index" do
    get companies_url
    assert_response :success
  end

  test "GET new" do
    get new_company_url
    assert_response :success
  end
end

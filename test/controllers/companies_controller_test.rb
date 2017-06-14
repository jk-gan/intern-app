require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get companies_url
    assert_equal "index", @controller.action_name
    assert_response :success
  end

  test "should get new" do
    get new_company_url
    assert_equal "new", @controller.action_name
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post companies_url, params: { company: attributes_for(:company) }
      assert_equal "create", @controller.action_name
    end

    assert_redirected_to company_path(Company.last)
    assert_equal 'Company successfully created', flash[:success]
  end

  test "shouldn't create company with error" do
    assert_no_difference('Company.count') do
      post companies_url, params: { company: attributes_for(:company, name: nil) }
      assert_equal "create", @controller.action_name
    end

    assert_equal 'Failed to create company', flash[:error]
  end
end

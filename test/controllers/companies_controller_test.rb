require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = companies(:apple)
  end

  test "should get index" do
    get companies_url
    assert_equal "index", @controller.action_name
    assert_response :success
  end

  test "should get show" do
    get company_url(@company)
    assert_equal "show", @controller.action_name
    assert_response :success
  end

  test "should get new" do
    get new_company_url
    assert_equal "new", @controller.action_name
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post companies_url, params: { company: @company.attributes }
      assert_equal "create", @controller.action_name
    end

    assert_redirected_to company_path(Company.last)
    assert_equal 'Company successfully created', flash[:success]
  end

  test "shouldn't create company with error" do
    assert_no_difference('Company.count') do
      post companies_url, params: { company: { name: nil, description: @company.description, size: @company.size, website: @company.website } }
      assert_equal "create", @controller.action_name
    end

    assert_equal 'Failed to create company', flash[:error]
  end

  test "should get edit" do
    get edit_company_url(@company)
    assert_equal "edit", @controller.action_name
    assert_response :success
  end

  test "should update company" do
    patch company_url(@company), params: { company: { name: "Updated Company" } }
    assert_equal "update", @controller.action_name

    assert_redirected_to @company
    assert_equal 'Company successfully edited', flash[:success]
    # Reload association to fetch updated data and assert that title is updated.
    @company.reload
    assert_equal "Updated Company", @company.name
  end

  test "shouldn't update company with error" do
    company_name = @company.name

    patch company_url(@company), params: { company: { name: nil } }
    assert_equal "update", @controller.action_name

    assert_equal 'Failed to edit company', flash[:error]
    # Reload association to fetch updated data and assert that title is updated.
    @company.reload
    assert_equal company_name, @company.name
  end
end

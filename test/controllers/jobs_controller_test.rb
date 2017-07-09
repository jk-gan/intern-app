require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = companies(:apple)
  end

  test "should get index" do
    get company_jobs_url(@company)
    assert_equal "index", @controller.action_name
    assert_response :success
  end

  test "should get show" do
    get job_url(@company.jobs.first)
    assert_equal "show", @controller.action_name
    assert_response :success
  end
end

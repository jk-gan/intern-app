require "application_system_test_case"

class CompanyFlowsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url

    assert_selector "h1", text: "We are Kojo"
  end
end

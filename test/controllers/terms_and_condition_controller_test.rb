require "test_helper"

class TermsAndConditionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get terms_and_condition_index_url
    assert_response :success
  end
end

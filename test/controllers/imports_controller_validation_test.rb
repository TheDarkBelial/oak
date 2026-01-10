require "test_helper"

class ImportsControllerValidationTest < ActionDispatch::IntegrationTest
  test "should validate the import" do
    post quotes_url, params: { import: { host: "" } }

    assert_response :bad_request
  end
end

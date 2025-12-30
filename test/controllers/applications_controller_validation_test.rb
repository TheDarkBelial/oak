require "test_helper"

class ApplicationsControllerValidationTest < ActionDispatch::IntegrationTest
  setup do
    @application = applications(:unifi)
    @application_params = {
      icon_id: nil,
      name: nil,
      url: nil
    }
  end

  test "should validate creating the application" do
    assert_no_difference("Application.count") do
      post applications_url, params: { application: @application_params }
    end

    assert_response :unprocessable_content
  end

  test "should validate updating the application" do
    patch application_url(@application), params: { application: @application_params }

    assert_response :unprocessable_content
  end
end

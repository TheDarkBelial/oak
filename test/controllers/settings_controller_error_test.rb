require "test_helper"

class SettingsControllerErrorTest < ActionDispatch::IntegrationTest
  setup do
    @setting = settings(:theme)
    @setting_params = {}
  end

  test "should redirect to 404 when trying to update a missing setting" do
    patch setting_url("missing"), params: { setting: @setting_params }

    assert_redirected_to error_url(code: 404), status: :missing
  end

  test "should redirect to 400 when trying to update an setting with invalid parameters" do
    patch setting_url(@setting), params: { setting: {} }

    assert_redirected_to error_url(code: 400), status: :bad_request
  end
end

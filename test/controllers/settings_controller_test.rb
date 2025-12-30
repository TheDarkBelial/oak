require "test_helper"

class SettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @setting = settings(:theme)
    @setting_params = { value: "gruvbox" }
  end

  test "should get index" do
    get settings_url

    assert_response :success
  end

  test "should update the setting" do
    patch setting_url(@setting), params: { setting: @setting_params }

    assert_redirected_to root_url
    assert_flash :success, "Setting updated."
    assert_attributes_contain(@setting.reload, @setting_params)
  end
end

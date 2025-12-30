require "test_helper"

class ThemesControllerValidationTest < ActionDispatch::IntegrationTest
  setup do
    @theme = themes(:forest)
    @theme_params = { name: nil }
  end

  test "should validate creating the theme" do
    assert_no_difference("Theme.count") do
      post themes_url, params: { theme: @theme_params }
    end

    assert_response :unprocessable_content
  end

  test "should validate updating the theme" do
    patch theme_url(@theme), params: { theme: @theme_params }

    assert_response :unprocessable_content
  end
end

require "test_helper"

class ThemesControllerErrorTest < ActionDispatch::IntegrationTest
  setup do
    @theme = themes(:forest)
    @theme_params = {}
  end

  test "should redirect to 404 when trying to view a missing theme" do
    get theme_url("missing")

    assert_redirected_to error_url(code: 404), status: :missing
  end

  test "should redirect to 400 when trying to create an theme with invalid parameters" do
    post themes_url, params: { theme: {} }

    assert_redirected_to error_url(code: 400), status: :bad_request
  end

  test "should redirect to 404 when trying to edit a missing theme" do
    get edit_theme_url("missing")

    assert_redirected_to error_url(code: 404), status: :missing
  end

  test "should redirect to 404 when trying to update a missing theme" do
    patch theme_url("missing"), params: { theme: @theme_params }

    assert_redirected_to error_url(code: 404), status: :missing
  end

  test "should redirect to 400 when trying to update an theme with invalid parameters" do
    patch theme_url(@theme), params: { theme: {} }

    assert_redirected_to error_url(code: 400), status: :bad_request
  end

  test "should redirect to 404 when trying to delete a missing theme" do
    delete theme_url("missing")

    assert_redirected_to error_url(code: 404), status: :missing
  end
end

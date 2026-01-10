require "test_helper"

class IconsControllerErrorTest < ActionDispatch::IntegrationTest
  setup do
    @icon = icons(:unifi)
  end

  test "should redirect to 404 when trying to view a missing icon" do
    get icon_url("missing", format: :svg)

    assert_redirected_to error_url(code: 404), status: :missing
  end

  test "should respond with 406 when trying to view a invalid content type" do
    get icon_url(@icon, format: :jpg)

    assert_response :not_acceptable
    assert_content_type :jpg
  end
end

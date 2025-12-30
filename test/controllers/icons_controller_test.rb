require "test_helper"

class IconsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @icon = icons(:unifi)
  end

  test "should render a SVG" do
    get icon_url(@icon, format: :svg)

    assert_response :success
    assert_content_type :svg
  end

  test "should render a PNG" do
    get icon_url(@icon, format: :png)

    assert_response :success
    assert_content_type :png
  end
end

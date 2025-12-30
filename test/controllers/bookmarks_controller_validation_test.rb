require "test_helper"

class BookmarksControllerValidationTest < ActionDispatch::IntegrationTest
  setup do
    @bookmark = bookmarks(:ruby)
    @bookmark_params = {
      category_id: nil,
      name: nil,
      url: nil
    }
  end

  test "should validate creating the bookmark" do
    assert_no_difference("Bookmark.count") do
      post bookmarks_url, params: { bookmark: @bookmark_params }
    end

    assert_response :unprocessable_content
  end

  test "should validate updating the bookmark" do
    patch bookmark_url(@bookmark), params: { bookmark: @bookmark_params }

    assert_response :unprocessable_content
  end
end

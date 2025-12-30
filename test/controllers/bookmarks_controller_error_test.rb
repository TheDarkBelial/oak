require "test_helper"

class BookmarksControllerErrorTest < ActionDispatch::IntegrationTest
  setup do
    @bookmark = bookmarks(:ruby)
    @bookmark_params = {}
  end

  test "should redirect to 404 when trying to view a missing bookmark" do
    get bookmark_url("missing")

    assert_redirected_to error_url(code: 404), status: :missing
  end

  test "should redirect to 400 when trying to create an bookmark with invalid parameters" do
    post bookmarks_url, params: { bookmark: {} }

    assert_redirected_to error_url(code: 400), status: :bad_request
  end

  test "should redirect to 404 when trying to edit a missing bookmark" do
    get edit_bookmark_url("missing")

    assert_redirected_to error_url(code: 404), status: :missing
  end

  test "should redirect to 404 when trying to update a missing bookmark" do
    patch bookmark_url("missing"), params: { bookmark: @bookmark_params }

    assert_redirected_to error_url(code: 404), status: :missing
  end

  test "should redirect to 400 when trying to update an bookmark with invalid parameters" do
    patch bookmark_url(@bookmark), params: { bookmark: {} }

    assert_redirected_to error_url(code: 400), status: :bad_request
  end

  test "should redirect to 404 when trying to delete a missing bookmark" do
    delete bookmark_url("missing")

    assert_redirected_to error_url(code: 404), status: :missing
  end
end

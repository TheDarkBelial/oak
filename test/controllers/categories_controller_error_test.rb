require "test_helper"

class CategoriesControllerErrorTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:languages)
    @category_params = {}
  end

  test "should redirect to 404 when trying to view a missing category" do
    get category_url("missing")

    assert_redirected_to error_url(code: 404), status: :missing
  end

  test "should redirect to 400 when trying to create an category with invalid parameters" do
    post categories_url, params: { category: {} }

    assert_redirected_to error_url(code: 400), status: :bad_request
  end

  test "should redirect to 404 when trying to edit a missing category" do
    get edit_category_url("missing")

    assert_redirected_to error_url(code: 404), status: :missing
  end

  test "should redirect to 404 when trying to update a missing category" do
    patch category_url("missing"), params: { category: @category_params }

    assert_redirected_to error_url(code: 404), status: :missing
  end

  test "should redirect to 400 when trying to update an category with invalid parameters" do
    patch category_url(@category), params: { category: {} }

    assert_redirected_to error_url(code: 400), status: :bad_request
  end

  test "should redirect to 404 when trying to delete a missing category" do
    delete category_url("missing")

    assert_redirected_to error_url(code: 404), status: :missing
  end
end

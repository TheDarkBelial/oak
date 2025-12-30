require "test_helper"

class CategoriesControllerValidationTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:languages)
    @category_params = { name: nil }
  end

  test "should validate creating the category" do
    assert_no_difference("Category.count") do
      post categories_url, params: { category: @category_params }
    end

    assert_response :unprocessable_content
  end

  test "should validate updating the category" do
    patch category_url(@category), params: { category: @category_params }

    assert_response :unprocessable_content
  end
end

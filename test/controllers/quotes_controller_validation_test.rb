require "test_helper"

class QuotesControllerValidationTest < ActionDispatch::IntegrationTest
  setup do
    @quote = quotes(:life)
    @quote_params = {
      name: nil,
      author: nil
    }
  end

  test "should validate creating the quote" do
    assert_no_difference("Quote.count") do
      post quotes_url, params: { quote: @quote_params }
    end

    assert_response :unprocessable_content
  end

  test "should validate updating the quote" do
    patch quote_url(@quote), params: { quote: @quote_params }

    assert_response :unprocessable_content
  end
end

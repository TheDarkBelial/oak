require "test_helper"

class QuotesControllerErrorTest < ActionDispatch::IntegrationTest
  setup do
    @quote = quotes(:life)
    @quote_params = {}
  end

  test "should redirect to 404 when trying to view a missing quote" do
    get quote_url("missing")

    assert_redirected_to error_url(code: 404), status: :missing
  end

  test "should redirect to 400 when trying to create an quote with invalid parameters" do
    post quotes_url, params: { quote: {} }

    assert_redirected_to error_url(code: 400), status: :bad_request
  end

  test "should redirect to 404 when trying to edit a missing quote" do
    get edit_quote_url("missing")

    assert_redirected_to error_url(code: 404), status: :missing
  end

  test "should redirect to 404 when trying to update a missing quote" do
    patch quote_url("missing"), params: { quote: @quote_params }

    assert_redirected_to error_url(code: 404), status: :missing
  end

  test "should redirect to 400 when trying to update an quote with invalid parameters" do
    patch quote_url(@quote), params: { quote: {} }

    assert_redirected_to error_url(code: 400), status: :bad_request
  end

  test "should redirect to 404 when trying to delete a missing quote" do
    delete quote_url("missing")

    assert_redirected_to error_url(code: 404), status: :missing
  end
end

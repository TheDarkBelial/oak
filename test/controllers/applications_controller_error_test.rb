require "test_helper"

class ApplicationsControllerErrorTest < ActionDispatch::IntegrationTest
  setup do
    @application = applications(:unifi)
    @application_params = {}
  end

  test "should redirect to 404 when trying to view a missing application" do
    get application_url("missing")

    assert_redirected_to error_url(code: 404), status: :missing
  end

  test "should redirect to 400 when trying to create an application with invalid parameters" do
    post applications_url, params: { application: {} }

    assert_redirected_to error_url(code: 400), status: :bad_request
  end

  test "should redirect to 404 when trying to edit a missing application" do
    get edit_application_url("missing")

    assert_redirected_to error_url(code: 404), status: :missing
  end

  test "should redirect to 404 when trying to update a missing application" do
    patch application_url("missing"), params: { application: @application_params }

    assert_redirected_to error_url(code: 404), status: :missing
  end

  test "should redirect to 400 when trying to update an application with invalid parameters" do
    patch application_url(@application), params: { application: {} }

    assert_redirected_to error_url(code: 400), status: :bad_request
  end

  test "should redirect to 404 when trying to delete a missing application" do
    delete application_url("missing")

    assert_redirected_to error_url(code: 404), status: :missing
  end
end

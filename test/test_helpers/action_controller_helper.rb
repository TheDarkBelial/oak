

module ActionControllerHelper
  def assert_content_type(content_type)
    assert_equal Mime::EXTENSION_LOOKUP[content_type.to_s], response.content_type
  end

  def assert_flash(key, value)
    assert_equal value, flash[key]
  end
end

class ActionDispatch::IntegrationTest
  include ActionControllerHelper
end

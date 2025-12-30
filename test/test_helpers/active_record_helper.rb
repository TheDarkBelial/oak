module ActiveRecordHelper
  def assert_attributes_contain(record, attrs)
    attrs.each do |key, value|
      assert_equal value, record.attributes[key.to_s], "Wrong value for #{key}"
    end
  end
end

class ActionDispatch::IntegrationTest
  include ActiveRecordHelper
end

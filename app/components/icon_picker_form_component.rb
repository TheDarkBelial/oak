# frozen_string_literal: true

require "securerandom"

class IconPickerFormComponent < ViewComponent::Base
  def initialize(form, object, method, options = {})
    @form = form
    @object = object
    @method = method
    @value = object.public_send(@method)
    @options = options
  end

  def icon
    Icon.find_by(id: @value)
  end
end

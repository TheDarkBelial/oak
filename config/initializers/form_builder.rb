class DaisyFormBuilder < ActionView::Helpers::FormBuilder
  delegate :tag, :safe_join, to: :@template

  def label(method, content_or_options = nil, options = {}, &)
    if content_or_options.is_a?(Hash)
      content_or_options[:class] = merge_html_classes(content_or_options[:class], "label")
    else
      options[:class] = merge_html_classes(options[:class], "label")
    end

    super
  end

  def check_box(method, options = {}, checked_value = "1", unchecked_value = "0")
    options[:class] = merge_html_classes(options[:class], "toggle toggle-primary")
    super
  end

  def text_field(method, options = {})
    options[:class] = merge_html_classes(options[:class], "input")
    super
  end

  def url_field(method, options = {})
    options[:class] = merge_html_classes(options[:class], "input")
    super
  end

  def text_area(method, options = {})
    options[:class] = merge_html_classes(options[:class], "textarea")
    super
  end

  def select(method, choices = nil, options = {}, html_options = {}, &)
    html_options[:class] = merge_html_classes(html_options[:class], "select")
    super
  end

  def collection_select(method, collection, value_method, text_method, options = {}, html_options = {}, &)
    html_options[:class] = merge_html_classes(html_options[:class], "select")
    super
  end

  def oklch_field(method, options = {})
    render_view_component(OklchPickerFormComponent.new(self, @object, method, options))
  end

  def icon_field(method, options = {})
    render_view_component(IconPickerFormComponent.new(self, @object, method, options))
  end

  private

  def html_class_to_array(html_class)
    if html_class.is_a?(String)
      html_class.split(" ")
    elsif html_class.is_a?(Array)
      html_class
    else
      []
    end
  end

  def merge_html_classes(existing_classes, new_classes)
    (html_class_to_array(existing_classes) + html_class_to_array(new_classes)).uniq.join(" ")
  end

  def render_view_component(component)
    ApplicationController.renderer.render(component, layout: false)
  end
end

ActionView::Base.default_form_builder = DaisyFormBuilder
ENV["RANSACK_FORM_BUILDER"] = ActionView::Base.default_form_builder.name if defined?(Ransack)

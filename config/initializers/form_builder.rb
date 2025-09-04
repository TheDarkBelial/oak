class DaisyFormBuilder < ActionView::Helpers::FormBuilder
  delegate :tag, :safe_join, to: :@template

  # def form_control(options = {}, &)
  #   options[:class] = merge_html_classes(options[:class], "form-control")
  #   tag.label(**options, &)
  # end

  def label(attribute, text = nil, options = {}, &)
    options[:class] = merge_html_classes(options[:class], "label")
    super
  end

  def check_box(attribute, options = {}, checked_value = "1", unchecked_value = "0")
    options[:class] = merge_html_classes(options[:class], "toggle toggle-primary")
    super
  end

  def text_field(attribute, options = {})
    options[:class] = merge_html_classes(options[:class], "input input-bordered")
    super
  end

  def url_field(attribute, options = {})
    options[:class] = merge_html_classes(options[:class], "input input-bordered")
    super
  end

  def text_area(attribute, options = {})
    options[:class] = merge_html_classes(options[:class], "textarea textarea-bordered")
    super
  end

  def select(attribute, choices = nil, options = {}, html_options = {}, &)
    html_options[:class] = merge_html_classes(html_options[:class], "select select-bordered")
    super
  end

  def collection_select(attribute, collection, value_method, text_method, options = {}, html_options = {}, &)
    html_options[:class] = merge_html_classes(html_options[:class], "select select-bordered")
    super
  end

  # def submit(value = nil, options = {})
  #   options[:class] = merge_html_classes(options[:class], "btn btn-primary")
  #   super
  # end

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
end

ActionView::Base.default_form_builder = DaisyFormBuilder
ENV["RANSACKS_FORM_BUILDER"] = ActionView::Base.default_form_builder.name if defined?(Ransack)

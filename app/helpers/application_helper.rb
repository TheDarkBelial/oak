module ApplicationHelper
  def notice_tag(type, message, duration: 1000)
    data = { controller: "notice", notice_duration_value: duration, turbo_permanent: true }

    # A unique ID is required so Turbo does not merge notices when morphing.
    content_tag(:div, id: "OAK#{SecureRandom.base58}", class: "notice notice-#{type}", data:) do
      tag.span(message)
    end
  end
end

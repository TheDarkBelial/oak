class Current < ActiveSupport::CurrentAttributes
  attribute :theme, default: -> { Theme.find_by(slug: Setting[:theme]) || Theme.default }
end

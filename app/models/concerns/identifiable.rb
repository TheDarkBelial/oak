module Identifiable
  extend ActiveSupport::Concern

  class_methods do
    attr_accessor :identity_key

    def identifies_by(attribute)
      self.identity_key = attribute
    end
  end

  included do
    def to_param = send(self.class.identity_key)
    def to_key = [ to_param ]
  end
end

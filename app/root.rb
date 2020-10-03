# frozen_string_literal: true

module Root
  class << self
    def find(resource)
      Object.const_get(resource.sub(/\A./, &:upcase))
    end

    def GET(environment)
      [200, {}, ['hi']]
    end
  end
end

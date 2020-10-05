# frozen_string_literal: true

module Root
  class << self
    def find(resource)
      const_get(resource.sub(/\A./, &:upcase)) if exist?(resource)
    end

    def GET(environment)
      [200, {}, ['hi']]
    end

    private

    def exist?(resource)
      Pathname(resource).sub_ext('.rb').expand_path(__dir__).exist?
    end
  end
end

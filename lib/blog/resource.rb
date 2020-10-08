# frozen_string_literal: true

module Blog
  module Resource
    def call(environment)
      public_send(environment.fetch('REQUEST_METHOD'), environment)
    rescue
      # TODO: 500
    end
  end
end

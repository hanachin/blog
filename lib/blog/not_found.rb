# frozen_string_literal: true

module Blog
  class NotFound < StandardError
    def call(_environment)
      [
        404,
        { 'Content-Type' => 'text/plain' }.freeze,
        ['404 Not Found'].freeze
      ].freeze
    end
  end
end

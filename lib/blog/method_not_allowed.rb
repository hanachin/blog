# frozen_string_literal: true

module Blog
  class MethodNotAllowed < StandardError
    def call(_environment)
      [
        405,
        { 'Content-Type' => 'text/plain' }.freeze,
        ['405 Method Not Allowed'].freeze
      ].freeze
    end
  end
end

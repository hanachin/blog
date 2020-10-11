# frozen_string_literal: true

module Blog
  class MethodNotAllowed < ::Blog::HttpError
    def call(_environment)
      [
        405,
        { 'Content-Type' => 'text/plain' }.freeze,
        ['405 Method Not Allowed'].freeze
      ].freeze
    end
  end
end

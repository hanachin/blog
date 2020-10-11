# frozen_string_literal: true

module Blog
  class InternalServerError < ::Blog::HttpError
    def call(_environment)
      [
        500,
        { 'Content-Type' => 'text/plain' }.freeze,
        ['500 Internal Server Error'].freeze
      ].freeze
    end
  end
end

# frozen_string_literal: true

module Blog
  module InternalServerError
    class << self
      include Resource

      def GET(_environment)
        [
          500,
          { 'Content-Type' => 'text/plain' }.freeze,
          ['500 Internal Server Error'].freeze
        ].freeze
      end
    end
  end
end

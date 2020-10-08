# frozen_string_literal: true

module Blog
  module NotFound
    class << self
      include Resource

      def GET(_environment)
        [
          404,
          { 'Content-Type' => 'text/plain' }.freeze,
          ['404 Not Found'].freeze
        ].freeze
      end
    end
  end
end

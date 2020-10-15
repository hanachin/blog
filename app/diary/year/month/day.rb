# frozen_string_literal: true

module Diary
  class Year
    class Month
      class Day
        include ::Blog::Resource

        def initialize(year:, month:, day:)
          @year = year
          @month = month
          @day = day
        end

        def GET(environment)
          [200, { 'Content-Type' => 'text/plain; charset=UTF-8' }, [source]]
        end

        private

        def source
          File.read(source_path)
        rescue ::Errno::ENOENT
          raise ::Blog::NotFound
        end

        def source_path
          ::Root.path.parent.join('source', 'diary', @year, @month, @day).sub_ext('.md')
        end
      end
    end
  end
end

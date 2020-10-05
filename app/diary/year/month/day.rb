module Diary
  class Year
    class Month
      class Day
        def initialize(year:, month:, day:)
          @year = year
          @month = month
          @day = day
        end

        def GET(environment)
          [200, { 'Content-Type' => 'text/plain; charset=UTF-8' }, [File.read(source_path)]]
        end

        private

        def source_path
          ::Blog.root_path.join('source', 'diary', @year, @month, @day).sub_ext('.md')
        end
      end
    end
  end
end

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
          [200, {}, ["#@year-#@month-#@day"]]
        end
      end
    end
  end
end

# frozen_string_literal: true

module Diary
  class Year
    class Month
      include ::Blog::Resource

      def initialize(year:, month:)
        @year = year
        @month = month
      end

      def find(day)
        ::Diary::Year::Month::Day.new(year: @year, month: @month, day: day)
      end
    end
  end
end

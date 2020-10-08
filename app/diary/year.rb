# frozen_string_literal: true

module Diary
  class Year
    def initialize(year:)
      @year = year
    end

    def find(month)
      ::Diary::Year::Month.new(year: @year, month: month)
    end
  end
end


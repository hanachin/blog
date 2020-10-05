module Diary
  class << self
    def find(year)
      ::Diary::Year.new(year: year)
    end
  end
end

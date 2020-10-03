# frozen_string_literal: true

module Blog
  class << self
    def call(environment)
      # TODO: limit max nest level, and compact PATH_INFO, ex. gsub(%r{/+}, '/')
      ::Blog::Resource.find(environment.fetch('PATH_INFO'), ::Root).call(environment)
    end
  end
end

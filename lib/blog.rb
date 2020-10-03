# frozen_string_literal: true

module Blog
  class << self
    def call(environment)
      # TODO: limit max nest level, and compact PATH_INFO, ex. gsub(%r{/+}, '/')
      ::Blog::Resource.new(environment.fetch('PATH_INFO'), current_resource: ::Root).call(environment)
    end
  end
end

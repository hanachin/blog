# frozen_string_literal: true

module Blog
  class << self
    def call(environment)
      # TODO: limit max nest level
      ::Blog::Resource.find(environment.fetch('PATH_INFO').gsub(%r{/+}, '/'), ::Root).call(environment)
    end
  end
end

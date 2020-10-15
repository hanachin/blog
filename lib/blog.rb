# frozen_string_literal: true

module Blog
  class << self
    def call(environment)
      resource = ::Root.find(environment.fetch('PATH_INFO').gsub(%r{/+}, '/'))

      raise ::Blog::NotFound unless resource

      resource.call(environment)
    end

    def root_path
      Pathname(__dir__).parent
    end
  end
end

# frozen_string_literal: true

module Blog
  class << self
    def call(environment)
      begin
        # TODO: limit max nest level
        resource = ::Root.find(environment.fetch('PATH_INFO').gsub(%r{/+}, '/')) or raise
      rescue
        resource = ::Blog::NotFound
      end
      resource.call(environment)
    end

    def root_path
      Pathname(__dir__).parent
    end
  end
end

# frozen_string_literal: true

module Blog
  class << self
    def call(environment)
      # TODO: limit max nest level
      ::Root.find(environment.fetch('PATH_INFO').gsub(%r{/+}, '/')).call(environment)
    end

    def root_path
      Pathname(__dir__).parent
    end
  end
end

# frozen_string_literal: true

module Blog
  class Resource
    class << self
      def find(path, current_resource)
        return new(current_resource) if path.empty?

        resource, sub_resource = path.split('/', 2)
        found_resource = resource.empty? ? current_resource : current_resource.find(resource)
        find(sub_resource || '', found_resource)
      rescue
        # TODO: 404
      end
    end

    def initialize(resource)
      @resource = resource
    end

    def call(environment)
      @resource.public_send(environment.fetch('REQUEST_METHOD'), environment)
    end
  end
end

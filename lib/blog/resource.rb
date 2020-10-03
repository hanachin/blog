# frozen_string_literal: true

module Blog
  class Resource
    def initialize(path, current_resource:)
      @resource = find_resource(path, current_resource)
    end

    def call(environment)
      @resource.public_send(environment.fetch('REQUEST_METHOD'), environment)
    end

    private

    def find_resource(path, current_resource)
      return current_resource if path.empty?

      resource, sub_resource = path.split('/', 2)
      found_resource = resource.empty? ? current_resource : current_resource.find(resource)
      find_resource(sub_resource || '', found_resource)
    rescue
      # TODO: 404
    end
  end
end

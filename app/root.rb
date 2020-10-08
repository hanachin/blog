# frozen_string_literal: true

class Root
  include ::Blog::Resource

  class << self
    def find(path, current_resource = new)
      return current_resource if path.empty?

      resource, sub_resource = path.split('/', 2)
      found_resource = resource.empty? ? current_resource : current_resource.find(resource)
      find(sub_resource || '', found_resource)
    end
  end

  def find(resource)
    Object.const_get(resource.sub(/\A./, &:upcase)) if exist?(resource)
  end

  def GET(environment)
    [200, {}, ['hi']]
  end

  private

  def exist?(resource)
    Pathname(resource).sub_ext('.rb').expand_path(__dir__).exist?
  end
end

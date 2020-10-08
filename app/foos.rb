class Foos
  include ::Blog::Resource

  class << self
    include ::Blog::Resource

    def find(id)
      new(id: id)
    end

    def GET(environment)
      [200, {}, [name]]
    end
  end

  def initialize(id:)
    @id = id
  end

  def GET(environment)
    [200, {}, [inspect]]
  end
end

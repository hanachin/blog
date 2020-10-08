# frozen_string_literal: true

module Blog
  module Resource
    def call(environment)
      request_method = environment.fetch('REQUEST_METHOD')
      public_send(request_method, environment)
    rescue
      internal_server_error.public_send(request_method, environment)
    end

    def internal_server_error
      ::Blog::InternalServerError
    end
  end
end

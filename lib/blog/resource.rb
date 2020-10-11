# frozen_string_literal: true

module Blog
  module Resource
    def call(environment)
      request_method = environment.fetch('REQUEST_METHOD')

      raise ::Blog::MethodNotAllowed unless http_method?(request_method)
      raise ::Blog::MethodNotAllowed unless respond_to?(request_method)

      call_http_method(request_method, environment)
    end

    private

    def call_http_method(...)
      public_send(...)
    rescue ::Blog::HttpError
      raise
    rescue
      raise ::Blog::InternalServerError
    end

    def http_method?(request_method)
      case request_method
      in 'GET' | 'POST' | 'PUT' | 'PATCH' | 'DELETE'
        true
      else
        false
      end
    end
  end
end

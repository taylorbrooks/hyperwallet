module Hyperwallet
  class Error < StandardError; end
  class BadGateway < Error; end
  class BadRequest < Error; end
  class Forbidden < Error; end
  class GatewayTimeout < Error; end
  class InternalServerError < Error; end
  class NotFound < Error; end
  class ServiceUnavailable < Error; end
  class Unauthorized < Error; end
end

module Hyperwallet
  class ErrorHandler < Faraday::Middleware
    ERROR_STATUSES = 400..600

    def on_complete(env)
      case env[:status]
      when 400
        raise Hyperwallet::BadRequest, error_message(env)
      when 401
        raise Hyperwallet::Unauthorized, error_message(env)
      when 403
        raise Hyperwallet::Forbidden, error_message(env)
      when 404
        raise Hyperwallet::NotFound, error_message(env)
      when 500
        raise Hyperwallet::InternalServerError, error_message(env)
      when 502
        raise Hyperwallet::BadGateway, error_message(env)
      when 503
        raise Hyperwallet::ServiceUnavailable, error_message(env)
      when 504
        raise Hyperwallet::GatewayTimeout, error_message(env)
      when ERROR_STATUSES
        raise Hyperwallet::Error, error_message(env)
      end
    end

    private

    def error_message(env)
      "#{env[:status]}: #{env[:url]} #{env[:body]}"
    end
  end
end

Faraday::Response.register_middleware(hyperwallet_errors: Hyperwallet::ErrorHandler)

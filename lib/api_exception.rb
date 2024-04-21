module ApiException
  class BaseError < StandardError; end

  module Handler
    EXCEPTIONS = {
      ActiveRecord::RecordInvalid => { status: :unprocessable_entity, error: "Invalid request" },
      ActionController::ParameterMissing => { status: :bad_request, error: "Invalid Parameters" },
      ActionDispatch::Http::Parameters::ParseError => { status: 400, error: "Bad request" }
    }

    def self.included(klass)
      klass.class_eval do
        EXCEPTIONS.each do |exception_class, context|
          rescue_from exception_class do |exception|
            render_error_response(context[:status], context[:error], exception.message)
          end
        end
      end
    end

    private

    def render_error_response(status, error, message = nil)
      response_data = { error: error }
      response_data[:message] = message if message.present?

      render status: status, json: response_data
    end
  end
end

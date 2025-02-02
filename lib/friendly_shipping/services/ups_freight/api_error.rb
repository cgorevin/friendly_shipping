# frozen_string_literal: true

require 'friendly_shipping/api_error'

module FriendlyShipping
  module Services
    class UpsFreight
      class ApiError < FriendlyShipping::ApiError
        # @param [RestClient::Exception] cause
        def initialize(cause)
          super cause, parse_message(cause)
        end

        private

        # @param [RestClient::Exception] cause
        def parse_message(cause)
          parsed_json = JSON.parse(cause.response.body)

          if parsed_json['httpCode'].present?
            status = [parsed_json['httpCode'], parsed_json['httpMessage']].compact.join(" ")
            desc = parsed_json['moreInformation']
            [status, desc].compact.join(": ")
          else
            errors = parsed_json.dig('response', 'errors') || []
            errors.map do |err|
              status = err['code']
              desc = err['message']
              [status, desc].compact.join(": ").presence || "UPS Freight could not process the request."
            end.join("\n")
          end
        end
      end
    end
  end
end

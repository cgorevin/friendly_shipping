# frozen_string_literal: true

require 'friendly_shipping/services/ups/rate_estimate_package_options'

module FriendlyShipping
  module Services
    # Option container for rating a shipment via UPS
    #
    # Required:
    #
    # @option shipper_number [String] The shipper number of the origin of the shipment.
    #
    # Optional:
    #
    # @option carbon_neutral [Boolean] Ship with UPS' carbon neutral program
    # @option customer_context [String ] Optional element to identify transactions between client and server
    # @option customer_classification [Symbol] Which kind of rates to request. See UPS docs for more details. Default: `shipper_number`
    # @option negotiated_rates [Boolean] if truthy negotiated rates will be requested from ups. Only valid if
    #   shipper account has negotiated rates. Default: false
    # @option saturday_delivery [Boolean] should we request Saturday delivery?. Default: false
    # @option saturday_pickup [Boolean] should we request Saturday pickup?. Default: false
    # @option shipping_method [FriendlyShipping::ShippingMethod] Request rates for a particular shipping method only?
    #   Default is `nil`, which translates to 'All shipping methods' (The "Shop" option in UPS parlance)
    # @option with_time_in_transit [Boolean] Whether to request timing information alongside the rates
    # @option package_options_class [Class] See FriendlyShipping::ShipmentOptions
    #
    class Ups
      class RateEstimateOptions < FriendlyShipping::ShipmentOptions
        PICKUP_TYPE_CODES = {
          daily_pickup: "01",
          customer_counter: "03",
          one_time_pickup: "06",
          on_call_air: "07",
          suggested_retail_rates: "11",
          letter_center: "19",
          air_service_center: "20"
        }.freeze

        CUSTOMER_CLASSIFICATION_CODES = {
          shipper_number: "00",
          daily_rates: "01",
          retail_rates: "04",
          regional_rates: "05",
          general_rates: "06",
          standard_rates: "53"
        }.freeze

        attr_reader :carbon_neutral,
                    :customer_context,
                    :destination_account,
                    :negotiated_rates,
                    :saturday_delivery,
                    :saturday_pickup,
                    :shipper,
                    :shipper_number,
                    :shipping_method,
                    :with_time_in_transit

        def initialize(
          shipper_number:,
          carbon_neutral: true,
          customer_context: nil,
          customer_classification: :daily_rates,
          destination_account: nil,
          negotiated_rates: false,
          pickup_type: :daily_pickup,
          saturday_delivery: false,
          saturday_pickup: false,
          shipper: nil,
          shipping_method: nil,
          with_time_in_transit: false,
          package_options_class: FriendlyShipping::Services::Ups::RateEstimatePackageOptions,
          **kwargs
        )
          @carbon_neutral = carbon_neutral
          @customer_context = customer_context
          @customer_classification = customer_classification
          @destination_account = destination_account
          @negotiated_rates = negotiated_rates
          @shipper_number = shipper_number
          @pickup_type = pickup_type
          @saturday_delivery = saturday_delivery
          @saturday_pickup = saturday_pickup
          @shipper = shipper
          @shipping_method = shipping_method
          @with_time_in_transit = with_time_in_transit
          super(**kwargs.merge(package_options_class: package_options_class))
        end

        def pickup_type_code
          PICKUP_TYPE_CODES[@pickup_type]
        end

        def customer_classification_code
          CUSTOMER_CLASSIFICATION_CODES[@customer_classification]
        end
      end
    end
  end
end

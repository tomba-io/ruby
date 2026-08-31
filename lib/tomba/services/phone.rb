# frozen_string_literal: true

module Tomba
  # Phone service for phone number lookup and validation.
  #
  # Provides methods to find and validate phone numbers.
  #
  # @see https://docs.tomba.io/api/phone
  class Phone < Service
    # Phone Finder
    #
    # Finds a phone number using search parameters.
    #
    # @see https://docs.tomba.io/api/phone#phone-finder
    # @param params [Hash] search parameters (e.g., email, domain)
    # @param webhook_url [String, nil] webhook URL for async notifications
    # @return [Hash] API response containing phone number data
    # @raise [Tomba::Exception]
    def finder(params, webhook_url: nil)
      raise Tomba::Exception, 'Missing required parameter: "params"' if params.nil? || params.empty?

      path = '/phone-finder'

      params[:webhook_url] = webhook_url unless webhook_url.nil?

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end

    # Phone Validator
    #
    # Validates a phone number and returns detailed information about it.
    #
    # @see https://docs.tomba.io/api/phone#phone-validator
    # @param phone [String] the phone number to validate
    # @param country_code [String, nil] optional ISO country code (e.g., "US")
    # @return [Hash] API response containing validation results
    # @raise [Tomba::Exception]
    def validator(phone, country_code: nil)
      raise Tomba::Exception, 'Missing required parameter: "phone"' if phone.nil?

      path = '/phone-validator'

      params = { phone: phone }
      params[:country_code] = country_code unless country_code.nil?

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end
  end
end

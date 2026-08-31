# frozen_string_literal: true

module Tomba
  # Usage service for retrieving API usage statistics.
  #
  # Provides methods to get account usage information.
  #
  # @see https://docs.tomba.io/api/account#retrieve-api-usage
  class Usage < Service
    # Get Usage
    #
    # Returns the current API usage statistics for the account.
    #
    # @see https://docs.tomba.io/api/account#retrieve-api-usage#get-usage
    # @return [Hash] API response containing usage statistics
    # @raise [Tomba::Exception]
    def get_usage
      path = '/usage'

      params = {}

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end
  end
end

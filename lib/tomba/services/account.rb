# frozen_string_literal: true

module Tomba
  # Account service for retrieving account information.
  #
  # Provides methods to get the current account details.
  #
  # @see https://docs.tomba.io/api/account
  class Account < Service
    # Get Account
    #
    # Returns information about the current account.
    #
    # @see https://docs.tomba.io/api/account#get-account
    # @return [Hash] API response containing account details
    # @raise [Tomba::Exception]
    def get_account
      path = '/me'

      params = {}

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end
  end
end

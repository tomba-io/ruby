# frozen_string_literal: true

module Tomba
  # Keys service for managing API keys.
  #
  # Provides methods to list, create, reset, and delete API keys.
  #
  # @see https://docs.tomba.io/api/keys
  class Keys < Service
    # List all API keys.
    #
    # Returns all API keys associated with the account.
    #
    # @see https://docs.tomba.io/api/keys
    # @return [Hash] API response containing the list of keys
    # @raise [Tomba::Exception]
    def get_keys
      path = '/keys'

      params = {}

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end

    # Get a specific API key by ID.
    #
    # @see https://docs.tomba.io/api/keys#get-key
    # @param id [String] the key ID
    # @return [Hash] API response
    # @raise [Tomba::Exception]
    def get_key(id:)
      raise Tomba::Exception, 'Missing required parameter: "id"' if id.nil?

      path = "/keys/#{id}"

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, {})
    end

    # Delete an API key.
    #
    # Removes a specific API key by its ID.
    #
    # @see https://docs.tomba.io/api/keys#delete-an-api-key
    # @param id [String] the key ID to delete
    # @return [Hash] API response
    # @raise [Tomba::Exception]
    def delete_key(id:)
      raise Tomba::Exception, 'Missing required parameter: "id"' if id.nil?

      path = "/keys/#{id}"

      params = {}

      @client.call('delete', path, {
                     'content-type' => 'application/json'
                   }, params)
    end

    # Create a new API key.
    #
    # Generates a new API key for the account.
    #
    # @see https://docs.tomba.io/api/keys#create-an-api-key
    # @return [Hash] API response containing the new key
    # @raise [Tomba::Exception]
    def create_key
      path = '/keys'

      params = {}

      @client.call('post', path, {
                     'content-type' => 'application/json'
                   }, params)
    end

    # Reset an API key.
    #
    # Regenerates a specific API key by its ID.
    #
    # @see https://docs.tomba.io/api/keys#reset-an-api-key
    # @param id [String] the key ID to reset
    # @return [Hash] API response containing the reset key
    # @raise [Tomba::Exception]
    def reset_key(id:)
      raise Tomba::Exception, 'Missing required parameter: "id"' if id.nil?

      path = "/keys/#{id}"

      params = {}

      @client.call('put', path, {
                     'content-type' => 'application/json'
                   }, params)
    end
  end
end

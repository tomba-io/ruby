# frozen_string_literal: true

module Tomba
  # Flag service for managing email flags.
  #
  # Provides methods to list and create flags for email addresses.
  #
  # @see https://docs.tomba.io/api/flag
  class Flag < Service
    # List Flags
    #
    # Returns all flags associated with the account.
    #
    # @see https://docs.tomba.io/api/flag#list-flags
    # @param page [Integer, nil] the page number for pagination
    # @param limit [Integer, nil] the number of results per page
    # @return [Hash] API response containing the list of flags
    # @raise [Tomba::Exception]
    def list_flags(page: nil, limit: nil)
      path = '/flags'

      params = {}
      params[:page] = page unless page.nil?
      params[:limit] = limit unless limit.nil?

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end

    # Create Flag
    #
    # Creates a new flag for an email address.
    #
    # @see https://docs.tomba.io/api/flag#create-flag
    # @param email [String] the email address to flag
    # @param reason [String, nil] optional reason for the flag
    # @return [Hash] API response containing the created flag
    # @raise [Tomba::Exception]
    def create_flag(email:, reason: nil)
      raise Tomba::Exception, 'Missing required parameter: "email"' if email.nil?

      path = '/flags'

      params = { email: email }
      params[:reason] = reason unless reason.nil?

      @client.call('post', path, {
                     'content-type' => 'application/json'
                   }, params)
    end
  end
end

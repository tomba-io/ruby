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
      path = '/flag'

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
    # @param flag_type [String] the type of flag
    # @param value [String] the value to flag
    # @param reason [String] the reason for the flag
    # @param comment [String, nil] optional comment for the flag
    # @return [Hash] API response containing the created flag
    # @raise [Tomba::Exception]
    def create_flag(flag_type:, value:, reason:, comment: nil)
      raise Tomba::Exception, 'Missing required parameter: "flag_type"' if flag_type.nil?
      raise Tomba::Exception, 'Missing required parameter: "value"' if value.nil?
      raise Tomba::Exception, 'Missing required parameter: "reason"' if reason.nil?

      path = '/flag'

      params = { flag_type: flag_type, value: value, reason: reason }
      params[:comment] = comment unless comment.nil?

      @client.call('post', path, {
                     'content-type' => 'application/json'
                   }, params)
    end
  end
end

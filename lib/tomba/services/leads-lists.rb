# frozen_string_literal: true

module Tomba
  # Leads Lists service for managing lead lists.
  #
  # Provides methods to list, create, update, and delete lead lists.
  #
  # @see https://docs.tomba.io/api/leads-lists
  class LeadsLists < Service
    # List all leads lists.
    #
    # Returns all leads lists associated with the account.
    #
    # @see https://docs.tomba.io/api/leads-lists#list-leads-lists
    # @return [Hash] API response containing the lists
    # @raise [Tomba::Exception]
    def get_lists
      path = '/leads_lists'

      params = {}

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end

    # Delete a leads list.
    #
    # Removes a specific leads list by its ID.
    #
    # @see https://docs.tomba.io/api/leads-lists#delete-leads-list
    # @param id [String] the list ID to delete
    # @return [Hash] API response
    # @raise [Tomba::Exception]
    def delete_list_id(id:)
      raise Tomba::Exception, 'Missing required parameter: "id"' if id.nil?

      path = "/leads_lists/#{id}"

      params = {}

      @client.call('delete', path, {
                     'content-type' => 'application/json'
                   }, params)
    end

    # Create a new leads list.
    #
    # Creates a new leads list for organizing leads.
    #
    # @see https://docs.tomba.io/api/leads-lists#create-leads-list
    # @return [Hash] API response containing the new list
    # @raise [Tomba::Exception]
    def create_list
      path = '/leads_lists'

      params = {}

      @client.call('post', path, {
                     'content-type' => 'application/json'
                   }, params)
    end

    # Update a leads list.
    #
    # Updates a specific leads list by its ID.
    #
    # @see https://docs.tomba.io/api/leads-lists#update-leads-list
    # @param id [String] the list ID to update
    # @return [Hash] API response
    # @raise [Tomba::Exception]
    def update_list_id(id:)
      raise Tomba::Exception, 'Missing required parameter: "id"' if id.nil?

      path = "/leads_lists/#{id}"

      params = {}

      @client.call('put', path, {
                     'content-type' => 'application/json'
                   }, params)
    end
  end
end

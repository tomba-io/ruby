# frozen_string_literal: true

module Tomba
  # Leads Attributes service for managing lead attributes.
  #
  # Provides methods to list, create, update, and delete lead attributes.
  #
  # @see https://docs.tomba.io/api/leads-attributes
  class LeadsAttributes < Service
    # List all lead attributes.
    #
    # Returns all lead attributes associated with the account.
    #
    # @see https://docs.tomba.io/api/leads-attributes#list-lead-attributes
    # @return [Hash] API response containing the attributes
    # @raise [Tomba::Exception]
    def get_lead_attributes
      path = '/attributes'

      params = {}

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end

    # Delete a lead attribute.
    #
    # Removes a specific lead attribute by its ID.
    #
    # @see https://docs.tomba.io/api/leads-attributes#delete-lead-attribute
    # @param id [String] the attribute ID to delete
    # @return [Hash] API response
    # @raise [Tomba::Exception]
    def delete_lead_attribute(id:)
      raise Tomba::Exception, 'Missing required parameter: "id"' if id.nil?

      path = "/attributes/#{id}"

      params = {}

      @client.call('delete', path, {
                     'content-type' => 'application/json'
                   }, params)
    end

    # Create a new lead attribute.
    #
    # Creates a new lead attribute for organizing lead data.
    #
    # @see https://docs.tomba.io/api/leads-attributes#create-lead-attribute
    # @return [Hash] API response containing the new attribute
    # @raise [Tomba::Exception]
    def create_lead_attribute
      path = '/attributes'

      params = {}

      @client.call('post', path, {
                     'content-type' => 'application/json'
                   }, params)
    end

    # Update a lead attribute.
    #
    # Updates a specific lead attribute by its ID.
    #
    # @see https://docs.tomba.io/api/leads-attributes#update-lead-attribute
    # @param id [String] the attribute ID to update
    # @return [Hash] API response
    # @raise [Tomba::Exception]
    def update_lead_attribute(id:)
      raise Tomba::Exception, 'Missing required parameter: "id"' if id.nil?

      path = "/attributes/#{id}"

      params = {}

      @client.call('put', path, {
                     'content-type' => 'application/json'
                   }, params)
    end
  end
end

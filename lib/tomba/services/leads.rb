# frozen_string_literal: true

module Tomba
  # Leads service for managing individual leads.
  #
  # Provides methods to list, get, create, update, and delete leads.
  #
  # @see https://docs.tomba.io/api/leads
  class Leads < Service
    # List Leads
    #
    # Returns a paginated list of leads.
    #
    # @see https://docs.tomba.io/api/leads
    # @param page [Integer, nil] the page number for pagination
    # @param limit [Integer, nil] the number of results per page
    # @param domain [String, nil] filter leads by domain
    # @return [Hash] API response containing the list of leads
    # @raise [Tomba::Exception]
    def list_leads(page: nil, limit: nil, domain: nil)
      path = '/leads'

      params = {}
      params[:page] = page unless page.nil?
      params[:limit] = limit unless limit.nil?
      params[:domain] = domain unless domain.nil?

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end

    # Get Lead
    #
    # Returns a specific lead by its ID.
    #
    # @see https://docs.tomba.io/api/leads#retrieve-a-single-lead
    # @param id [String] the lead ID
    # @return [Hash] API response containing the lead data
    # @raise [Tomba::Exception]
    def get_lead(id)
      raise Tomba::Exception, 'Missing required parameter: "id"' if id.nil?

      path = "/leads/#{id}"

      params = {}

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end

    # Create Lead
    #
    # Creates a new lead with the provided data.
    #
    # @see https://docs.tomba.io/api/leads#create-a-lead
    # @param data [Hash] the lead data (e.g., email, first_name, last_name)
    # @return [Hash] API response containing the created lead
    # @raise [Tomba::Exception]
    def create_lead(**data)
      path = '/leads'

      @client.call('post', path, {
                     'content-type' => 'application/json'
                   }, data)
    end

    # Update Lead
    #
    # Updates an existing lead by its ID.
    #
    # @see https://docs.tomba.io/api/leads#update-a-lead
    # @param id [String] the lead ID to update
    # @param data [Hash] the lead data to update
    # @return [Hash] API response containing the updated lead
    # @raise [Tomba::Exception]
    def update_lead(id, **data)
      raise Tomba::Exception, 'Missing required parameter: "id"' if id.nil?

      path = "/leads/#{id}"

      @client.call('put', path, {
                     'content-type' => 'application/json'
                   }, data)
    end

    # Delete Lead
    #
    # Deletes a specific lead by its ID.
    #
    # @see https://docs.tomba.io/api/leads#delete-a-lead
    # @param id [String] the lead ID to delete
    # @return [Hash] API response
    # @raise [Tomba::Exception]
    def delete_lead(id)
      raise Tomba::Exception, 'Missing required parameter: "id"' if id.nil?

      path = "/leads/#{id}"

      params = {}

      @client.call('delete', path, {
                     'content-type' => 'application/json'
                   }, params)
    end
  end
end

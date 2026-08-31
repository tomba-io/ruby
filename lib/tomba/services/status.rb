# frozen_string_literal: true

module Tomba
  # Status service for domain status and autocomplete.
  #
  # Provides methods to check domain status and get domain suggestions.
  #
  # @see https://docs.tomba.io/api/status
  class Status < Service
    # Domain Status
    #
    # Returns the status of a domain, including whether it is webmail or disposable.
    #
    # @see https://docs.tomba.io/api/status#domain-status
    # @param domain [String] the domain name to check
    # @return [Hash] API response containing domain status
    # @raise [Tomba::Exception]
    def domain_status(domain:)
      raise Tomba::Exception, 'Missing required parameter: "domain"' if domain.nil?

      path = '/domain-status'

      params = {}
      params[:domain] = domain unless domain.nil?

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end

    # Autocomplete
    #
    # Returns domain suggestions based on a search query.
    #
    # @see https://docs.tomba.io/api/status#domain-suggestions
    # @param query [String] the search query for domain suggestions
    # @return [Hash] API response containing domain suggestions
    # @raise [Tomba::Exception]
    def auto_complete(query:)
      raise Tomba::Exception, 'Missing required parameter: "query"' if query.nil?

      path = '/domain-suggestions'

      params = {}
      params[:query] = query unless query.nil?

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end
  end
end

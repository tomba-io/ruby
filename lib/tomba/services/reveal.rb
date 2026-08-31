# frozen_string_literal: true

module Tomba
  # Reveal service for company search.
  #
  # Provides methods to search for companies.
  #
  # @see https://docs.tomba.io/api/reveal
  class Reveal < Service
    # Companies Search
    #
    # Searches for companies matching the given parameters.
    #
    # @see https://docs.tomba.io/api/reveal#companies-search
    # @param params [Hash] search parameters (e.g., query, page, limit)
    # @return [Hash] API response containing matching companies
    # @raise [Tomba::Exception]
    def companies_search(params)
      raise Tomba::Exception, 'Missing required parameter: "params"' if params.nil? || params.empty?

      path = '/reveal'

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end
  end
end

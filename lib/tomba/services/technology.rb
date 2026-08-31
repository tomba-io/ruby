# frozen_string_literal: true

module Tomba
  # Technology service for detecting website technologies.
  #
  # Provides methods to discover the technologies used by a website.
  #
  # @see https://docs.tomba.io/api/domain#technology
  class Technology < Service
    # List Technologies
    #
    # Returns the technologies detected on a given domain.
    #
    # @see https://docs.tomba.io/api/domain#technology#list-technologies
    # @param domain [String] the domain name to analyze
    # @return [Hash] API response containing detected technologies
    # @raise [Tomba::Exception]
    def list(domain)
      raise Tomba::Exception, 'Missing required parameter: "domain"' if domain.nil?

      path = '/technology'

      params = { domain: domain }

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end
  end
end

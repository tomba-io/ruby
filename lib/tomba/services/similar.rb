# frozen_string_literal: true

module Tomba
  # Similar service for finding similar websites.
  #
  # Provides methods to find websites similar to a given domain.
  #
  # @see https://docs.tomba.io/api/similar
  class Similar < Service
    # Similar Websites
    #
    # Returns a list of websites similar to the given domain.
    #
    # @see https://docs.tomba.io/api/similar#similar-websites
    # @param domain [String] the domain name to find similar websites for
    # @return [Hash] API response containing similar websites
    # @raise [Tomba::Exception]
    def websites(domain)
      raise Tomba::Exception, 'Missing required parameter: "domain"' if domain.nil?

      path = '/similar'

      params = { domain: domain }

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end
  end
end

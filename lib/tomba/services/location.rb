# frozen_string_literal: true

module Tomba
  # Location service for retrieving company location data.
  #
  # Provides methods to get the geographic location associated with a domain.
  #
  # @see https://docs.tomba.io/api/finder#location
  class Location < Service
    # Get Location
    #
    # Returns the geographic location information for a given domain.
    #
    # @see https://docs.tomba.io/api/finder#location#get-location
    # @param domain [String] the domain name to look up location for
    # @return [Hash] API response containing location data
    # @raise [Tomba::Exception]
    def get_location(domain)
      raise Tomba::Exception, 'Missing required parameter: "domain"' if domain.nil?

      path = '/location'

      params = { domain: domain }

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end
  end
end

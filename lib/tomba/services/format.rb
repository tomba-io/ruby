# frozen_string_literal: true

module Tomba
  # Format service for discovering email formats.
  #
  # Provides methods to find the email format used by a domain.
  #
  # @see https://docs.tomba.io/api/format
  class Format < Service
    # Email Format
    #
    # Returns the email format used by a given domain (e.g., first.last, first_last).
    #
    # @see https://docs.tomba.io/api/format#email-format
    # @param domain [String] the domain name to look up the email format for
    # @return [Hash] API response containing the email format
    # @raise [Tomba::Exception]
    def email_format(domain)
      raise Tomba::Exception, 'Missing required parameter: "domain"' if domain.nil?

      path = '/email-format'

      params = { domain: domain }

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end
  end
end

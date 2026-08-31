# frozen_string_literal: true

module Tomba
  # Count service for email counting.
  #
  # Provides methods to get the number of email addresses found for a domain.
  #
  # @see https://docs.tomba.io/api/count
  class Count < Service
    # Email Count
    #
    # Returns the total number of email addresses found for a domain.
    #
    # @see https://docs.tomba.io/api/count#email-count
    # @param domain [String] the domain name to count emails for
    # @return [Hash] API response containing the email count
    # @raise [Tomba::Exception]
    def email_count(domain:)
      raise Tomba::Exception, 'Missing required parameter: "domain"' if domain.nil?

      path = '/email-count'

      params = {}
      params[:domain] = domain unless domain.nil?

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end
  end
end

# frozen_string_literal: true

module Tomba
  # Sources service for finding email sources.
  #
  # Provides methods to retrieve the sources where an email was found.
  #
  # @see https://docs.tomba.io/api/sources
  class Sources < Service
    # Email Sources
    #
    # Retrieves the sources where an email address has been found on the web.
    #
    # @see https://docs.tomba.io/api/sources#email-sources
    # @param email [String] the email address to look up sources for
    # @return [Hash] API response containing source information
    # @raise [Tomba::Exception]
    def email_sources(email:)
      raise Tomba::Exception, 'Missing required parameter: "email"' if email.nil?

      path = '/email-sources'

      params = {}
      params[:email] = email unless email.nil?

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end
  end
end

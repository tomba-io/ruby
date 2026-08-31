# frozen_string_literal: true

module Tomba
  # Verifier service for email verification.
  #
  # Provides methods to verify if an email address is valid and deliverable.
  #
  # @see https://docs.tomba.io/api/verifier
  class Verifier < Service
    # Email Verifier
    #
    # Verifies the deliverability of an email address.
    #
    # @see https://docs.tomba.io/api/verifier#email-verifier
    # @param email [String] the email address to verify
    # @param webhook_url [String, nil] webhook URL for async notifications
    # @return [Hash] API response containing verification results
    # @raise [Tomba::Exception]
    def email_verifier(email:, webhook_url: nil)
      raise Tomba::Exception, 'Missing required parameter: "email"' if email.nil?

      path = '/email-verifier'

      params = {}
      params[:email] = email unless email.nil?
      params[:webhook_url] = webhook_url unless webhook_url.nil?

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end
  end
end

# frozen_string_literal: true

module Tomba
  # Enrichment service for data enrichment.
  #
  # Provides methods to enrich person and company data.
  #
  # @see https://docs.tomba.io/api/enrichment
  class Enrichment < Service
    # Person Enrichment
    #
    # Enriches data about a person using their email address.
    #
    # @see https://docs.tomba.io/api/enrichment#person-enrichment
    # @param email [String] the email address of the person
    # @param webhook_url [String, nil] webhook URL for async notifications
    # @return [Hash] API response containing enriched person data
    # @raise [Tomba::Exception]
    def person(email, webhook_url: nil)
      raise Tomba::Exception, 'Missing required parameter: "email"' if email.nil?

      path = '/enrichment/person'

      params = { email: email }
      params[:webhook_url] = webhook_url unless webhook_url.nil?

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end

    # Company Enrichment
    #
    # Enriches data about a company using its domain name.
    #
    # @see https://docs.tomba.io/api/enrichment#company-enrichment
    # @param domain [String] the domain name of the company
    # @return [Hash] API response containing enriched company data
    # @raise [Tomba::Exception]
    def company(domain)
      raise Tomba::Exception, 'Missing required parameter: "domain"' if domain.nil?

      path = '/enrichment/company'

      params = { domain: domain }

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end

    # Combined Enrichment
    #
    # Returns combined person and company enrichment data for an email.
    #
    # @see https://docs.tomba.io/api/enrichment#combined-enrichment
    # @param email [String] the email address to enrich
    # @return [Hash] API response containing combined enrichment data
    # @raise [Tomba::Exception]
    def combined(email)
      raise Tomba::Exception, 'Missing required parameter: "email"' if email.nil?

      path = '/enrichment/combined'

      params = { email: email }

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end
  end
end

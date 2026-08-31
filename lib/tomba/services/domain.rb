# frozen_string_literal: true

module Tomba
  # Domain Search service.
  #
  # Search emails associated with a domain.
  #
  # @see https://docs.tomba.io/api/finder#domain-search
  class Domain < Service
    # Domain Search
    #
    # Returns all email addresses found for a given domain.
    #
    # @see https://docs.tomba.io/api/finder#domain-search#domain-search
    # @param domain [String] the domain name to search
    # @param page [Integer, nil] the page number for pagination
    # @param limit [Integer, nil] the number of results per page
    # @param department [String, nil] filter by department
    # @param enrich_mobile [Boolean, nil] whether to enrich mobile phone data
    # @param webhook_url [String, nil] webhook URL for async notifications
    # @return [Hash] API response containing the list of emails
    # @raise [Tomba::Exception]
    def domain_search(domain:, page: nil, limit: nil, department: nil, enrich_mobile: nil, webhook_url: nil)
      raise Tomba::Exception, 'Missing required parameter: "domain"' if domain.nil?

      path = '/domain-search/'

      params = {}

      params[:domain] = domain unless domain.nil?
      params[:page] = page unless page.nil?
      params[:limit] = limit unless limit.nil?
      params[:department] = department unless department.nil?
      params[:enrich_mobile] = enrich_mobile unless enrich_mobile.nil?
      params[:webhook_url] = webhook_url unless webhook_url.nil?

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end
  end
end

# frozen_string_literal: true

module Tomba
  # Finder service for email, author, LinkedIn, and phone lookups.
  #
  # Provides methods to find email addresses, authors, LinkedIn profiles,
  # and phone numbers.
  #
  # @see https://docs.tomba.io/api/finder
  class Finder < Service
    # Email Finder
    #
    # Generates or retrieves the most likely email address from a domain and name.
    #
    # @see https://docs.tomba.io/api/finder#email-finder
    # @param domain [String] the domain name
    # @param first_name [String] the first name of the person
    # @param last_name [String] the last name of the person
    # @param webhook_url [String, nil] webhook URL for async notifications
    # @return [Hash] API response
    # @raise [Tomba::Exception]
    def email_finder(domain:, first_name:, last_name:, webhook_url: nil)
      raise Tomba::Exception, 'Missing required parameter: "domain"' if domain.nil?
      raise Tomba::Exception, 'Missing required parameter: "first_name"' if first_name.nil?
      raise Tomba::Exception, 'Missing required parameter: "last_name"' if last_name.nil?

      path = '/email-finder'

      params = {}
      params[:domain] = domain unless domain.nil?
      params[:first_name] = first_name unless first_name.nil?
      params[:last_name] = last_name unless last_name.nil?
      params[:webhook_url] = webhook_url unless webhook_url.nil?

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end

    # Author Finder
    #
    # Retrieves the email address of the author of a given article URL.
    #
    # @see https://docs.tomba.io/api/finder#author-finder
    # @param url [String] the URL of the article
    # @param webhook_url [String, nil] webhook URL for async notifications
    # @return [Hash] API response
    # @raise [Tomba::Exception]
    def author_finder(url:, webhook_url: nil)
      raise Tomba::Exception, 'Missing required parameter: "url"' if url.nil?

      path = '/author-finder'

      params = {}
      params[:url] = url unless url.nil?
      params[:webhook_url] = webhook_url unless webhook_url.nil?

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end

    # LinkedIn Finder
    #
    # Retrieves the email address of a person from their LinkedIn URL.
    #
    # @see https://docs.tomba.io/api/finder#linkedin-finder
    # @param url [String] the LinkedIn profile URL
    # @param webhook_url [String, nil] webhook URL for async notifications
    # @return [Hash] API response
    # @raise [Tomba::Exception]
    def linkedin_finder(url:, webhook_url: nil)
      raise Tomba::Exception, 'Missing required parameter: "url"' if url.nil?

      path = '/linkedin'

      params = {}
      params[:url] = url unless url.nil?
      params[:webhook_url] = webhook_url unless webhook_url.nil?

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end

    # Phone Finder
    #
    # Retrieves the phone number associated with an email address.
    #
    # @see https://docs.tomba.io/api/finder#phone-finder
    # @param email [String] the email address to look up
    # @param webhook_url [String, nil] webhook URL for async notifications
    # @return [Hash] API response
    # @raise [Tomba::Exception]
    def phone_finder(email:, webhook_url: nil)
      raise Tomba::Exception, 'Missing required parameter: "email"' if email.nil?

      path = '/phone-finder'

      params = {}
      params[:email] = email unless email.nil?
      params[:webhook_url] = webhook_url unless webhook_url.nil?

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end
  end
end

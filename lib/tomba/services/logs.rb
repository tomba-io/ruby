# frozen_string_literal: true

module Tomba
  # Logs service for retrieving API request logs.
  #
  # Provides methods to get the history of API requests.
  #
  # @see https://docs.tomba.io/api/account#retrieve-api-logs
  class Logs < Service
    # Get Logs
    #
    # Returns the log history of API requests.
    #
    # @see https://docs.tomba.io/api/account#retrieve-api-logs#get-logs
    # @param page [Integer, nil] the page number for pagination
    # @param limit [Integer, nil] the number of results per page
    # @return [Hash] API response containing log entries
    # @raise [Tomba::Exception]
    def get_logs(page: nil, limit: nil)
      path = '/logs'

      params = {}
      params[:page] = page unless page.nil?
      params[:limit] = limit unless limit.nil?

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end
  end
end

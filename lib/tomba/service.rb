# frozen_string_literal: true

module Tomba
  # Base service class.
  #
  # All Tomba service classes inherit from this base class,
  # which provides access to the API client.
  class Service
    # Initialize the service with a Tomba client.
    #
    # @param client [Tomba::Client] the API client instance
    def initialize(client)
      @client = client
    end
  end
end

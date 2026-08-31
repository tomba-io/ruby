# frozen_string_literal: true

module Tomba
  # Custom exception class for Tomba API errors.
  #
  # Raised when the API returns an error response or when
  # required parameters are missing.
  #
  # @attr_reader code [Integer, nil] the HTTP status code or error code
  # @attr_reader response [Hash, nil] the full error response body
  class Exception < StandardError
    # @param message [String] the error message
    # @param code [Integer, nil] the HTTP status code or error code
    # @param response [Hash, nil] the full error response body
    def initialize(message, code = nil, response = nil)
      super(message)
      @code = code
      @response = response
    end

    attr_reader :code, :response
  end
end

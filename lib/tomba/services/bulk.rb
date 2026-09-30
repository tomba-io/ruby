# frozen_string_literal: true

module Tomba
  # Bulk service for managing bulk operations.
  #
  # Provides methods to list, get, create, launch, delete, archive,
  # rename, check progress, and download bulk tasks.
  #
  # @see https://docs.tomba.io/api/bulk
  class Bulk < Service
    VALID_TYPES = %w[search similar company finder enrich linkedin author verifier phone-finder phone-validator].freeze

    # Validate the bulk type parameter.
    #
    # @param type [String] the bulk type to validate
    # @raise [Tomba::Exception] if the type is not valid
    def validate_type(type)
      return if VALID_TYPES.include?(type)

      raise Tomba::Exception, "Invalid bulk type: \"#{type}\". Must be one of: #{VALID_TYPES.join(', ')}"
    end

    # List Bulk Tasks
    #
    # Returns a list of bulk tasks of the specified type.
    #
    # @see https://docs.tomba.io/api/bulks-tasks
    # @param type [String] the bulk task type (e.g., "searches", "verifiers")
    # @param params [Hash] optional query parameters for filtering
    # @return [Hash] API response containing the list of bulk tasks
    # @raise [Tomba::Exception]
    def list(type, params: {})
      raise Tomba::Exception, 'Missing required parameter: "type"' if type.nil?

      validate_type(type)

      path = "/bulk/#{type}"

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end

    # Get Bulk Task
    #
    # Returns a specific bulk task by type and ID.
    #
    # @see https://docs.tomba.io/api/bulk#get-bulk-task
    # @param type [String] the bulk task type
    # @param id [String] the bulk task ID
    # @return [Hash] API response containing the bulk task data
    # @raise [Tomba::Exception]
    def get(type, id)
      raise Tomba::Exception, 'Missing required parameter: "type"' if type.nil?

      validate_type(type)
      raise Tomba::Exception, 'Missing required parameter: "id"' if id.nil?

      path = "/bulk/#{type}/#{id}"

      params = {}

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end

    # Create Bulk Task
    #
    # Creates a new bulk task of the specified type.
    #
    # @see https://docs.tomba.io/api/bulks
    # @param type [String] the bulk task type
    # @param data [Hash] the bulk task data
    # @return [Hash] API response containing the created bulk task
    # @raise [Tomba::Exception]
    def create(type, data)
      raise Tomba::Exception, 'Missing required parameter: "type"' if type.nil?

      validate_type(type)

      path = "/bulk/#{type}"

      @client.call('post', path, {
                     'content-type' => 'application/json'
                   }, data)
    end

    # Launch Bulk Task
    #
    # Launches (starts) a bulk task by type and ID.
    #
    # @see https://docs.tomba.io/api/bulks
    # @param type [String] the bulk task type
    # @param id [String] the bulk task ID
    # @return [Hash] API response
    # @raise [Tomba::Exception]
    def launch(type, id)
      raise Tomba::Exception, 'Missing required parameter: "type"' if type.nil?

      validate_type(type)
      raise Tomba::Exception, 'Missing required parameter: "id"' if id.nil?

      path = "/bulk/#{type}/#{id}"

      params = {}

      @client.call('put', path, {
                     'content-type' => 'application/json'
                   }, params)
    end

    # Delete Bulk Task
    #
    # Deletes a bulk task by type and ID.
    #
    # @see https://docs.tomba.io/api/bulks
    # @param type [String] the bulk task type
    # @param id [String] the bulk task ID
    # @return [Hash] API response
    # @raise [Tomba::Exception]
    def delete(type, id)
      raise Tomba::Exception, 'Missing required parameter: "type"' if type.nil?

      validate_type(type)
      raise Tomba::Exception, 'Missing required parameter: "id"' if id.nil?

      path = "/bulk/#{type}/#{id}/delete"

      params = {}

      @client.call('delete', path, {
                     'content-type' => 'application/json'
                   }, params)
    end

    # Archive Bulk Task
    #
    # Archives a bulk task by type and ID.
    #
    # @see https://docs.tomba.io/api/bulks
    # @param type [String] the bulk task type
    # @param id [String] the bulk task ID
    # @return [Hash] API response
    # @raise [Tomba::Exception]
    def archive(type, id)
      raise Tomba::Exception, 'Missing required parameter: "type"' if type.nil?

      validate_type(type)
      raise Tomba::Exception, 'Missing required parameter: "id"' if id.nil?

      path = "/bulk/#{type}/#{id}/archive"

      params = {}

      @client.call('delete', path, {
                     'content-type' => 'application/json'
                   }, params)
    end

    # Rename Bulk Task
    #
    # Renames a bulk task by type and ID.
    #
    # @see https://docs.tomba.io/api/bulks
    # @param type [String] the bulk task type
    # @param id [String] the bulk task ID
    # @param name [String] the new name for the bulk task
    # @return [Hash] API response
    # @raise [Tomba::Exception]
    def rename(type, id, name)
      raise Tomba::Exception, 'Missing required parameter: "type"' if type.nil?

      validate_type(type)
      raise Tomba::Exception, 'Missing required parameter: "id"' if id.nil?
      raise Tomba::Exception, 'Missing required parameter: "name"' if name.nil?

      path = "/bulk/#{type}/#{id}/rename"

      params = { name: name }

      @client.call('put', path, {
                     'content-type' => 'application/json'
                   }, params)
    end

    # Bulk Task Progress
    #
    # Returns the progress status of a bulk task.
    #
    # @see https://docs.tomba.io/api/bulk#bulk-task-progress
    # @param type [String] the bulk task type
    # @param id [String] the bulk task ID
    # @return [Hash] API response containing progress data
    # @raise [Tomba::Exception]
    def progress(type, id)
      raise Tomba::Exception, 'Missing required parameter: "type"' if type.nil?

      validate_type(type)
      raise Tomba::Exception, 'Missing required parameter: "id"' if id.nil?

      path = "/bulk/#{type}/#{id}/progress"

      params = {}

      @client.call('get', path, {
                     'content-type' => 'application/json'
                   }, params)
    end

    # Download Bulk Task
    #
    # Downloads the results of a completed bulk task.
    #
    # @see https://docs.tomba.io/api/bulks
    # @param type [String] the bulk task type
    # @param id [String] the bulk task ID
    # @return [Hash] API response containing download data
    # @raise [Tomba::Exception]
    def download(type, id)
      raise Tomba::Exception, 'Missing required parameter: "type"' if type.nil?

      validate_type(type)
      raise Tomba::Exception, 'Missing required parameter: "id"' if id.nil?

      path = "/bulk/#{type}/#{id}/download"

      params = {}

      @client.call_raw('get', path, {
                         'content-type' => 'application/json'
                       }, params)
    end
  end
end

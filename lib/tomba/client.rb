# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'
require 'cgi'

module Tomba
  class Client
    METHOD_GET = 'get'
    METHOD_POST = 'post'
    METHOD_PUT = 'put'
    METHOD_PATCH = 'patch'
    METHOD_DELETE = 'delete'
    METHOD_HEAD = 'head'
    METHOD_OPTIONS = 'options'
    METHOD_CONNECT = 'connect'
    METHOD_TRACE = 'trace'

    def initialize
      @headers = {
        'content-type' => '',
        'user-agent' => "#{RUBY_PLATFORM}:ruby-#{RUBY_VERSION}",
        'x-sdk-version' => "tomba:ruby:v#{Tomba::VERSION}"

      }
      @endpoint = 'https://api.tomba.io/v1'
    end

    def set_key(value)
      add_header('x-tomba-key', value)

      self
    end

    def set_secret(value)
      add_header('x-tomba-secret', value)

      self
    end

    def set_endpoint(endpoint)
      @endpoint = endpoint

      self
    end

    def add_header(key, value)
      @headers[key.downcase] = value

      self
    end

    def call(method, path = '', headers = {}, params = {})
      uri = URI.parse(@endpoint + path + (method == METHOD_GET && params.length ? "?#{encode(params)}" : ''))
      fetch(method, uri, headers, params)
    end

    def call_raw(method, path = '', headers = {}, params = {})
      uri = URI.parse(@endpoint + path + (method == METHOD_GET && params.length ? "?#{encode(params)}" : ''))
      fetch_raw(method, uri, headers, params)
    end

    private

    def fetch(method, uri, headers, params, limit = 5)
      raise ArgumentError, 'Too Many HTTP Redirects' if limit.zero?

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = (uri.scheme == 'https')
      http.read_timeout = 120
      http.open_timeout = 120
      payload = ''

      headers = @headers.merge(headers)
      @boundary = '----A30#3ad1'
      if method != METHOD_GET
        payload = case headers['content-type'][0,
                                               headers['content-type'].index(';') || headers['content-type'].length]
                  when 'application/json'
                    params.to_json
                  else
                    encode(params)
                  end
      end

      begin
        response = http.send_request(method.upcase, uri.request_uri, payload, headers)
      rescue StandardError => e
        raise Tomba::Exception, e.message
      end

      # Handle Redirects
      if response.instance_of?(Net::HTTPRedirection) || response.instance_of?(Net::HTTPMovedPermanently)
        location = response['location']
        uri = URI.parse("#{uri.scheme}://#{uri.host}#{location}")

        return fetch(method, uri, headers, {}, limit - 1)
      end

      begin
        res = JSON.parse(response.body)
      rescue JSON::ParserError
        raise Tomba::Exception.new(response.body, response.code, nil)
      end

      raise Tomba::Exception.new(res['errors']['message'], res['errors']['code'], res) if response.code.to_i >= 400

      { 'data' => res, 'rate_limit' => parse_rate_limit(response) }
    end

    def fetch_raw(method, uri, headers, _params, limit = 5)
      raise ArgumentError, 'Too Many HTTP Redirects' if limit.zero?

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = (uri.scheme == 'https')
      http.read_timeout = 120
      http.open_timeout = 120

      headers = @headers.merge(headers)

      begin
        response = http.send_request(method.upcase, uri.request_uri, '', headers)
      rescue StandardError => e
        raise Tomba::Exception, e.message
      end

      if response.instance_of?(Net::HTTPRedirection) || response.instance_of?(Net::HTTPMovedPermanently)
        location = response['location']
        uri = URI.parse("#{uri.scheme}://#{uri.host}#{location}")
        return fetch_raw(method, uri, headers, {}, limit - 1)
      end

      raise Tomba::Exception.new(response.body, response.code, nil) if response.code.to_i >= 400

      { 'data' => response.body, 'rate_limit' => parse_rate_limit(response) }
    end

    def parse_rate_limit(response)
      {
        'x-second-rate-limit' => response['x-second-rate-limit']&.to_i,
        'x-minute-rate-limit' => response['x-minute-rate-limit']&.to_i,
        'x-daily-rate-limit' => response['x-daily-rate-limit']&.to_i,
        'x-minute-request-left' => response['x-minute-request-left']&.to_i,
        'x-daily-request-left' => response['x-daily-request-left']&.to_i,
        'x-minute-reset-seconds' => response['x-minute-reset-seconds']&.to_i,
        'x-daily-reset-seconds' => response['x-daily-reset-seconds']&.to_i,
        'retry-after' => response['retry-after']&.to_i,
        'ratelimit-policy' => response['ratelimit-policy'],
        'ratelimit' => response['ratelimit']
      }
    end

    def encode(value, key = nil)
      case value
      when Hash  then value.map { |k, v| encode(v, append_key(key, k)) }.join('&')
      when Array then value.map { |v| encode(v, "#{key}[]") }.join('&')
      when nil   then ''
      else
        "#{key}=#{CGI.escape(value.to_s)}"
      end
    end

    def append_key(root_key, key)
      root_key.nil? ? key : "#{root_key}[#{key}]"
    end
  end
end

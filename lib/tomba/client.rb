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

        def initialize()
            @headers = {
                'content-type' => '',
                'user-agent' => RUBY_PLATFORM + ':ruby-' + RUBY_VERSION,
                'x-sdk-version' => 'tomba:ruby:v1.0.0'

            }
            @endpoint = 'https://api.tomba.io/v1';
        end

        def set_key(value)
            add_header('x-tomba-key', value)

            return self
        end

        def set_secret(value)
            add_header('x-tomba-secret', value)

            return self
        end

        def set_endpoint(endpoint)
            @endpoint = endpoint

            return self
        end

        def add_header(key, value)
            @headers[key.downcase] = value

            return self
        end

        def call(method, path = '', headers = {}, params = {})
            uri = URI.parse(@endpoint + path + ((method == METHOD_GET && params.length) ? '?' + encode(params) : ''))
            return fetch(method, uri, headers, params)
        end

        protected

        private

        def fetch(method, uri, headers, params, limit = 5)
            raise ArgumentError, 'Too Many HTTP Redirects' if limit == 0

            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = (uri.scheme == 'https')
            payload = ''

            headers = @headers.merge(headers)
            @BOUNDARY = "----A30#3ad1"
            if (method != METHOD_GET)
                case headers['content-type'][0, headers['content-type'].index(';') || headers['content-type'].length]
                    when 'application/json'
                        payload = params.to_json
                    else
                        payload = encode(params)
                end
            end

            begin
                response = http.send_request(method.upcase, uri.request_uri, payload, headers)
            rescue => error
                raise Tomba::Exception.new(error.message)
            end

            # Handle Redirects
            if (response.class == Net::HTTPRedirection || response.class == Net::HTTPMovedPermanently)
                location = response['location']
                uri = URI.parse(uri.scheme + "://" + uri.host + "" + location)

                return fetch(method, uri, headers, {}, limit - 1)
            end

            begin
                res = JSON.parse(response.body);
            rescue JSON::ParserError => e
                raise Tomba::Exception.new(response.body, response.code, nil)
            end

            if(response.code.to_i >= 400)
                raise Tomba::Exception.new(res['errors']['message'], res['errors']['code'], res)
            end

            return res;
        end


        def encode(value, key = nil)
            case value
            when Hash  then value.map { |k,v| encode(v, append_key(key,k)) }.join('&')
            when Array then value.map { |v| encode(v, "#{key}[]") }.join('&')
            when nil   then ''
            else
            "#{key}=#{CGI.escape(value.to_s)}"
            end
        end

        def append_key(root_key, key)
            root_key.nil? ? key : "#{root_key}[#{key.to_s}]"
        end
    end
end

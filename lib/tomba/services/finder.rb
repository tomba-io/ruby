module Tomba
    class Finder < Service

        def email_finder(domain:, first_name:, last_name:)
            if domain.nil?
                raise Tomba::Exception.new('Missing required parameter: "domain"')
            end

            if first_name.nil?
                raise Tomba::Exception.new('Missing required parameter: "firstName"')
            end

            if last_name.nil?
                raise Tomba::Exception.new('Missing required parameter: "lastName"')
            end

            path = '/email-finder'

            params = {}

            if !domain.nil?
                params[:domain] = domain
            end

            if !first_name.nil?
                params[:first_name] = first_name
            end

            if !last_name.nil?
                params[:last_name] = last_name
            end

            return @client.call('get', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def author_finder(url:)
            if url.nil?
                raise Tomba::Exception.new('Missing required parameter: "url"')
            end

            path = '/author-finder'

            params = {}

            if !url.nil?
                params[:url] = url
            end


            return @client.call('get', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def linkedin_finder(url:)
            if url.nil?
                raise Tomba::Exception.new('Missing required parameter: "url"')
            end

            path = '/linkedin-finder'

            params = {}

            if !url.nil?
                params[:url] = url
            end


            return @client.call('get', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def phone_finder(email:)
            if email.nil?
                raise Tomba::Exception.new('Missing required parameter: "email"')
            end

            path = '/phone/{email}'
                .gsub('{email}', email)

            params = {}

            return @client.call('get', path, {
                'content-type' => 'application/json',
            }, params);
        end

        protected

        private
    end
end

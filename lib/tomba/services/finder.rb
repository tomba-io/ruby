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

            path = '/email-finder/{domain}'
                .gsub('{domain}', domain)

            params = {}

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


        protected

        private
    end 
end
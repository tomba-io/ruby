module Tomba
    class Status < Service

        def domain_status(domain:)
            if domain.nil?
                raise Tomba::Exception.new('Missing required parameter: "domain"')
            end

            path = '/domain-status'

            params = {}

            if !domain.nil?
                params[:domain] = domain
            end

            return @client.call('get', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def auto_complete(query:)
            if query.nil?
                raise Tomba::Exception.new('Missing required parameter: "query"')
            end

            path = '/domains-suggestion'

            params = {}

            if !query.nil?
                params[:query] = query
            end

            return @client.call('get', path, {
                'content-type' => 'application/json',
            }, params);
        end


        protected

        private
    end 
end
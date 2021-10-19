module Tomba
    class Domain < Service

        def domain_search(domain:, page: nil, limit: nil, department: nil)
            if domain.nil?
                raise Tomba::Exception.new('Missing required parameter: "domain"')
            end

            path = '/domain-search/{domain}'
                .gsub('{domain}', domain)

            params = {}

            if !page.nil?
                params[:page] = page
            end

            if !limit.nil?
                params[:limit] = limit
            end

            if !department.nil?
                params[:department] = department
            end

            return @client.call('get', path, {
                'content-type' => 'application/json',
            }, params);
        end


        protected

        private
    end 
end
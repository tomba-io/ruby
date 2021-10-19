module Tomba
    class Count < Service

        def email_count(domain:)
            if domain.nil?
                raise Tomba::Exception.new('Missing required parameter: "domain"')
            end

            path = '/email-count'

            params = {}

            if !domain.nil?
                params[:domain] = domain
            end

            return @client.call('get', path, {
                'content-type' => 'application/json',
            }, params);
        end


        protected

        private
    end 
end
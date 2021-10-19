module Tomba
    class Sources < Service

        def email_sources(email:)
            if email.nil?
                raise Tomba::Exception.new('Missing required parameter: "email"')
            end

            path = '/email-sources/{email}'
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
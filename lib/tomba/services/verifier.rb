module Tomba
    class Verifier < Service

        def email_verifier(email:)
            if email.nil?
                raise Tomba::Exception.new('Missing required parameter: "email"')
            end

            path = '/email-verifier/{email}'
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
module Tomba
    class Account < Service

        def get_account()
            path = '/me'

            params = {}

            return @client.call('get', path, {
                'content-type' => 'application/json',
            }, params);
        end


        protected

        private
    end 
end
module Tomba
    class Usage < Service

        def get_usage()
            path = '/usage'

            params = {}

            return @client.call('get', path, {
                'content-type' => 'application/json',
            }, params);
        end


        protected

        private
    end 
end
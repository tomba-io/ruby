module Tomba
    class Logs < Service

        def get_logs()
            path = '/logs'

            params = {}

            return @client.call('get', path, {
                'content-type' => 'application/json',
            }, params);
        end


        protected

        private
    end 
end
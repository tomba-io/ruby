module Tomba
    class Keys < Service

        def get_keys()
            path = '/keys/{id}'

            params = {}

            return @client.call('get', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def delete_key(id:)
            if id.nil?
                raise Tomba::Exception.new('Missing required parameter: "id"')
            end

            path = '/keys/{id}'
                .gsub('{id}', id)

            params = {}

            return @client.call('delete', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def create_key()
            path = '/keys/{id}'

            params = {}

            return @client.call('post', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def reset_key(id:)
            if id.nil?
                raise Tomba::Exception.new('Missing required parameter: "id"')
            end

            path = '/keys/{id}'
                .gsub('{id}', id)

            params = {}

            return @client.call('put', path, {
                'content-type' => 'application/json',
            }, params);
        end


        protected

        private
    end 
end
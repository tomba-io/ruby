module Tomba
    class LeadsLists < Service

        def get_lists()
            path = '/leads_lists/{id}'

            params = {}

            return @client.call('get', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def delete_list_id(id:)
            if id.nil?
                raise Tomba::Exception.new('Missing required parameter: "id"')
            end

            path = '/leads_lists/{id}'
                .gsub('{id}', id)

            params = {}

            return @client.call('delete', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def create_list()
            path = '/leads_lists/{id}'

            params = {}

            return @client.call('post', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def update_list_id(id:)
            if id.nil?
                raise Tomba::Exception.new('Missing required parameter: "id"')
            end

            path = '/leads_lists/{id}'
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
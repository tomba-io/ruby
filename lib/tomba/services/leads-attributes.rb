module Tomba
    class LeadsAttributes < Service

        def get_lead_attributes()
            path = '/leads/attributes/{id}'

            params = {}

            return @client.call('get', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def delete_lead_attribute(id:)
            if id.nil?
                raise Tomba::Exception.new('Missing required parameter: "id"')
            end

            path = '/leads/attributes/{id}'
                .gsub('{id}', id)

            params = {}

            return @client.call('delete', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def create_lead_attribute()
            path = '/leads/attributes/{id}'

            params = {}

            return @client.call('post', path, {
                'content-type' => 'application/json',
            }, params);
        end

        def update_lead_attribute(id:)
            if id.nil?
                raise Tomba::Exception.new('Missing required parameter: "id"')
            end

            path = '/leads/attributes/{id}'
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
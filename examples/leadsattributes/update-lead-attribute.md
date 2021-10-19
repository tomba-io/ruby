```ruby
require 'tomba'

client = Tomba::Client.new()

client
    .set_key('ta_xxxx') # Your Key
    .set_secret('ts_xxxx') # Your Secret
;

leads_attributes = Tomba::LeadsAttributes.new(client);

response = leads_attributes.update_lead_attribute(id: '[Lead_Attributes_ID]');

puts response
```

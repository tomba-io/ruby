```ruby
require 'tomba'

client = Tomba::Client.new()

client
    .set_key('ta_xxxx') # Your Key
    .set_secret('ts_xxxx') # Your Secret
;

leads_lists = Tomba::LeadsLists.new(client);

response = leads_lists.create_list();

puts response
```

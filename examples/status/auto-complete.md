```ruby
require 'tomba'

client = Tomba::Client.new()

client
    .set_key('ta_xxxx') # Your Key
    .set_secret('ts_xxxx') # Your Secret
;

status = Tomba::Status.new(client);

response = status.auto_complete(query: 'google');

puts response
```

```ruby
require 'tomba'

client = Tomba::Client.new()

client
    .set_key('ta_xxxx') # Your Key
    .set_secret('ts_xxxx') # Your Secret
;

status = Tomba::Status.new(client);

response = status.domain_status(domain: 'gmail.com');

puts response
```

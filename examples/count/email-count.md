```ruby
require 'tomba'

client = Tomba::Client.new()

client
    .set_key('ta_xxxx') # Your Key
    .set_secret('ts_xxxx') # Your Secret
;

count = Tomba::Count.new(client);

response = count.email_count(domain: 'tomba.io');

puts response
```

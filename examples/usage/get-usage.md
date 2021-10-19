```ruby
require 'tomba'

client = Tomba::Client.new()

client
    .set_key('ta_xxxx') # Your Key
    .set_secret('ts_xxxx') # Your Secret
;

usage = Tomba::Usage.new(client);

response = usage.get_usage();

puts response
```

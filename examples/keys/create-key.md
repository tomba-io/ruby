```ruby
require 'tomba'

client = Tomba::Client.new()

client
    .set_key('ta_xxxx') # Your Key
    .set_secret('ts_xxxx') # Your Secret
;

keys = Tomba::Keys.new(client);

response = keys.create_key();

puts response
```

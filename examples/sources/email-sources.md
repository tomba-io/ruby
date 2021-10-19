```ruby
require 'tomba'

client = Tomba::Client.new()

client
    .set_key('ta_xxxx') # Your Key
    .set_secret('ts_xxxx') # Your Secret
;

sources = Tomba::Sources.new(client);

response = sources.email_sources(email: 'b.mohamed@tomba.io');

puts response
```

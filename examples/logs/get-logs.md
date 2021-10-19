```ruby
require 'tomba'

client = Tomba::Client.new()

client
    .set_key('ta_xxxx') # Your Key
    .set_secret('ts_xxxx') # Your Secret
;

logs = Tomba::Logs.new(client);

response = logs.get_logs();

puts response
```

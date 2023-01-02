```ruby
require 'tomba'

client = Tomba::Client.new()

client
    .set_key('ta_xxxx') # Your Key
    .set_secret('ts_xxxx') # Your Secret
;

finder = Tomba::Finder.new(client);

response = finder.phone_finder(email: '******@zapier.com');

puts response
```

```ruby
require 'tomba'

client = Tomba::Client.new()

client
    .set_key('ta_xxxx') # Your Key
    .set_secret('ts_xxxx') # Your Secret
;

finder = Tomba::Finder.new(client);

response = finder.email_finder(domain: 'stripe.com', first_name: 'Moskoz', last_name: 'Dustin');

puts response
```

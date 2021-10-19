```ruby
require 'tomba'

client = Tomba::Client.new()

client
    .set_key('ta_xxxx') # Your Key
    .set_secret('ts_xxxx') # Your Secret
;

domain = Tomba::Domain.new(client);

response = domain.domain_search(domain: 'stripe.com');

puts response
```

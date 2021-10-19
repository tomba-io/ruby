```ruby
require 'tomba'

client = Tomba::Client.new()

client
    .set_key('ta_xxxx') # Your Key
    .set_secret('ts_xxxx') # Your Secret
;

verifier = Tomba::Verifier.new(client);

response = verifier.email_verifier(email: 'b.mohamed@tomba.io');

puts response
```

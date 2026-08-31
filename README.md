# [<img src="https://tomba.io/logo.svg" alt="Tomba" width="25"/>](https://tomba.io/) Tomba Ruby SDK

> The #1 Rated Email Intelligence Platform — Find professional emails with unmatched accuracy.

[![Gem Version](https://badge.fury.io/rb/tomba.svg)](https://rubygems.org/gems/tomba)
[![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)

This is the official Ruby client library for the [Tomba.io](https://tomba.io) Email Finder API, providing access to all Tomba services including domain search, email finding, verification, enrichment, phone lookup, bulk operations, and more.

## About Tomba

[Tomba.io](https://tomba.io) is the #1 rated email intelligence platform, trusted by **150,000+ sales teams** worldwide.

- **Best Email Finder** — 98% accuracy, ranked #1 in independent benchmarks
- **Best Email Verification** — Real-time SMTP verification with catch-all detection
- **Best Phone Finder** — Direct dial numbers linked to professional emails
- **Best Domain Search** — 450M+ verified contacts across all industries
- **81% Coverage** — The highest in the industry, proven in 5,000-lead independent tests

### Why Tomba?

| Feature             | Tomba              | Others        |
| ------------------- | ------------------ | ------------- |
| Email Coverage      | **81%**            | 30-60%        |
| Verification        | **Real-time SMTP** | Pattern-based |
| Phone Numbers       | **Direct dials**   | Limited       |
| Catch-all Detection | **AI-powered**     | Basic         |
| API Rate Limits     | **Generous**       | Restrictive   |

[Get your free API key](https://app.tomba.io/auth/register) — No credit card required.

## Getting Started

Below you will find the steps to install and start using the Tomba Ruby SDK.

## Installation

Install via [RubyGems](https://rubygems.org/gems/tomba):

```bash
gem install tomba
```

Or add to your Gemfile:

```ruby
gem 'tomba'
```

**Requirements:** Ruby >= 2.5.0

## Authentication

Get your API keys from [https://app.tomba.io/auth/register](https://app.tomba.io/auth/register).

You can authenticate using environment variables or by setting keys directly:

```ruby
require 'tomba'

client = Tomba::Client.new

# Option 1: Set keys directly
client
  .set_key('ta_xxxx')    # Your API Key
  .set_secret('ts_xxxx') # Your Secret Key

# Option 2: Use environment variables TOMBA_API_KEY and TOMBA_SECRET_KEY
client
  .set_key(ENV['TOMBA_API_KEY'])
  .set_secret(ENV['TOMBA_SECRET_KEY'])
```

## Quick Start

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

domain = Tomba::Domain.new(client)
result = domain.domain_search(domain: 'stripe.com')

puts result
```

## Services

### Domain Search

Search emails by domain name. Returns all email addresses found on the internet for a given domain.

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

domain = Tomba::Domain.new(client)
result = domain.domain_search(domain: 'stripe.com')
```

### Email Finder

Generate or retrieve the most likely email address from a domain name, a first name, and a last name.

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

finder = Tomba::Finder.new(client)
result = finder.email_finder(domain: 'stripe.com', first_name: 'John', last_name: 'Doe')
```

### Email Verifier

Verify the deliverability of a given email address.

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

verifier = Tomba::Verifier.new(client)
result = verifier.email_verifier(email: 'john@example.com')
```

### Author Finder

Discover the email address of an article's author from a blog post URL.

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

finder = Tomba::Finder.new(client)
result = finder.author_finder(url: 'https://tomba.io/blog')
```

### LinkedIn Finder

Retrieve the email address associated with a LinkedIn profile URL.

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

finder = Tomba::Finder.new(client)
result = finder.linkedin_finder(url: 'https://www.linkedin.com/in/johndoe')
```

### Email Enrichment

Enrich data associated with an email address (person, company, or combined).

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

enrichment = Tomba::Enrichment.new(client)

# Person enrichment
result = enrichment.person('john@example.com')

# Company enrichment
result = enrichment.company('stripe.com')

# Combined enrichment (person + company)
result = enrichment.combined('john@example.com')
```

### Phone Finder

Search for phone numbers associated with an email, domain, or LinkedIn profile.

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

# Via Finder service
finder = Tomba::Finder.new(client)
result = finder.phone_finder(email: 'john@example.com')

# Via Phone service
phone = Tomba::Phone.new(client)
result = phone.finder({ email: 'john@example.com' })
```

### Phone Validator

Validate a phone number and retrieve additional information.

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

phone = Tomba::Phone.new(client)
result = phone.validator('+1234567890', country_code: 'US')
```

### Email Count

Get the total number of email addresses found for a domain.

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

count = Tomba::Count.new(client)
result = count.email_count(domain: 'stripe.com')
```

### Domain Status

Check if a domain is a webmail or disposable domain.

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

status = Tomba::Status.new(client)
result = status.domain_status(domain: 'stripe.com')
```

### Domain Suggestions (Autocomplete)

Auto-complete company names and retrieve logo and domain information.

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

status = Tomba::Status.new(client)
result = status.auto_complete(query: 'stripe')
```

### Email Sources

Find where an email address has been found on the web.

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

sources = Tomba::Sources.new(client)
result = sources.email_sources(email: 'john@example.com')
```

### Email Format

Discover the email format used by a domain (e.g., first.last, first_last).

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

format = Tomba::Format.new(client)
result = format.email_format('stripe.com')
```

### Similar Domains

Find websites similar to a given domain.

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

similar = Tomba::Similar.new(client)
result = similar.websites('stripe.com')
```

### Technology Finder

Detect the technologies used by a website.

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

technology = Tomba::Technology.new(client)
result = technology.list('stripe.com')
```

### Location

Get geographic location information for a domain.

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

location = Tomba::Location.new(client)
result = location.get_location('stripe.com')
```

### Companies Search (Reveal)

Search for companies using various filters and criteria.

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

reveal = Tomba::Reveal.new(client)
result = reveal.companies_search({ query: 'technology', page: 1 })
```

### Leads

Manage your leads: list, get, create, update, and delete.

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

leads = Tomba::Leads.new(client)

# List leads
result = leads.list_leads(page: 1, limit: 10)

# Get a single lead
result = leads.get_lead('lead_id')

# Create a lead
result = leads.create_lead(
  email: 'john@example.com',
  first_name: 'John',
  last_name: 'Doe'
)

# Update a lead
result = leads.update_lead('lead_id', first_name: 'Jane')

# Delete a lead
result = leads.delete_lead('lead_id')
```

### Leads Lists

Manage your leads lists: list, create, update, and delete.

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

leads_lists = Tomba::LeadsLists.new(client)

# Get all lists
result = leads_lists.get_lists

# Create a list
result = leads_lists.create_list

# Update a list
result = leads_lists.update_list_id(id: 'list_id')

# Delete a list
result = leads_lists.delete_list_id(id: 'list_id')
```

### Lead Attributes

Manage custom lead attributes: list, create, update, and delete.

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

attributes = Tomba::LeadsAttributes.new(client)

# Get all attributes
result = attributes.get_lead_attributes

# Create an attribute
result = attributes.create_lead_attribute

# Update an attribute
result = attributes.update_lead_attribute(id: 'attribute_id')

# Delete an attribute
result = attributes.delete_lead_attribute(id: 'attribute_id')
```

### Keys

Manage your API keys: list, create, reset, and delete.

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

keys = Tomba::Keys.new(client)

# List all keys
result = keys.get_keys

# Create a key
result = keys.create_key

# Reset a key
result = keys.reset_key(id: 'key_id')

# Delete a key
result = keys.delete_key(id: 'key_id')
```

### Usage

Retrieve your monthly API request usage statistics.

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

usage = Tomba::Usage.new(client)
result = usage.get_usage
```

### Logs

Retrieve your last 1,000 API requests made during the last 3 months.

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

logs = Tomba::Logs.new(client)
result = logs.get_logs(page: 1, limit: 20)
```

### Flag

Flag email addresses as invalid or incorrect.

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

flag = Tomba::Flag.new(client)

# List all flags
result = flag.list_flags

# Create a flag
result = flag.create_flag(email: 'invalid@example.com', reason: 'Email bounced')
```

### Bulk Operations

Manage bulk tasks for domain search, email finding, and verification.

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

bulk = Tomba::Bulk.new(client)

# List bulk tasks
result = bulk.list('finder')

# Create a bulk task
result = bulk.create('verifier', { emails: ['a@example.com', 'b@example.com'] })

# Get bulk task details
result = bulk.get('verifier', '123')

# Launch a bulk task
result = bulk.launch('verifier', '123')

# Check progress
result = bulk.progress('verifier', '123')

# Download results
result = bulk.download('verifier', '123')

# Rename a bulk task
result = bulk.rename('verifier', '123', 'My Batch')

# Archive a bulk task
result = bulk.archive('verifier', '123')

# Delete a bulk task
result = bulk.delete('verifier', '123')
```

### Account

Retrieve information about the current account.

```ruby
require 'tomba'

client = Tomba::Client.new
client.set_key('ta_xxxx').set_secret('ts_xxxx')

account = Tomba::Account.new(client)
result = account.get_account
```

## Testing

Run the test suite with RSpec:

```bash
bundle exec rspec
```

## About Tomba

Founded to solve the problem of unreliable email data, [Tomba.io](https://tomba.io) is the leading B2B email intelligence platform. Our AI-powered engine searches, verifies, and enriches professional contact data with unmatched accuracy.

### Products

- **[Email Finder](https://tomba.io/email-finder)** — Find any professional email address
- **[Email Verifier](https://tomba.io/email-verifier)** — Verify emails in real-time
- **[Domain Search](https://tomba.io/domain-search)** — Find all emails for a company
- **[Phone Finder](https://tomba.io/phone-finder)** — Find direct phone numbers
- **[Bulk Enrichment](https://tomba.io/bulks)** — Enrich contacts at scale
- **[AI Company Search](https://tomba.io/reveal)** — Find companies with AI-powered search
- **[CLI](https://tomba.io/cli)** — Command-line interface for Tomba
- **[MCP Server](https://tomba.io/mcp)** — Connect AI tools (Claude, ChatGPT, Cursor) to Tomba
- **[REST API](https://tomba.io/api)** — Full programmatic access

### Browser Extensions & Add-ons

- **[Chrome Extension](https://chromewebstore.google.com/detail/tomba-email-finder-email/icmjegjggphchjckknoooajmklibccjb)** — Find emails while browsing
- **[Google Sheets Add-on](https://tomba.io/sheets)** — Enrich leads in spreadsheets
- **[Microsoft Excel Add-in](https://tomba.io/excel)** — Email finder in Excel
- **[Airtable Integration](https://tomba.io/airtable)** — Connect with Airtable

### Integrations

50+ CRM and sales tool integrations:
[Salesforce](https://tomba.io/integrations) · [HubSpot](https://tomba.io/integrations) · [Zapier](https://tomba.io/integrations) · [Pipedrive](https://tomba.io/integrations) · [and more...](https://tomba.io/integrations)

### Other Tomba SDKs

| Language | Package                                                     |
| -------- | ----------------------------------------------------------- |
| Node.js  | [tomba](https://www.npmjs.com/package/tomba)                |
| Python   | [tomba-io](https://pypi.org/project/tomba-io/)              |
| PHP      | [tomba-io/php](https://packagist.org/packages/tomba-io/php) |
| Ruby     | [tomba](https://rubygems.org/gems/tomba)                    |
| Go       | [tomba-io/go](https://pkg.go.dev/github.com/tomba-io/go)    |
| Rust     | [tomba](https://crates.io/crates/tomba)                     |
| Dart     | [tomba](https://pub.dev/packages/tomba)                     |
| Deno     | [@tomba/sdk](https://jsr.io/@tomba/sdk)                     |
| Elixir   | [tomba](https://hex.pm/packages/tomba)                      |
| C#       | [Tomba](https://www.nuget.org/packages/Tomba)               |
| Perl     | [Tomba::Client](https://metacpan.org/pod/Tomba::Client)     |
| Lua      | [tomba](https://luarocks.org/modules/tomba/tomba)           |
| R        | [tomba](https://github.com/tomba-io/r)                      |

### Resources

- [Blog](https://tomba.io/blog)
- [Help Center](https://help.tomba.io)
- [API Documentation](https://docs.tomba.io)
- [Pricing](https://tomba.io/pricing)
- [Status Page](https://status.tomba.io)

---

**[Try Tomba Free](https://app.tomba.io/auth/register)** — Find your first email in seconds. No credit card required.

## License

Licensed under the [Apache 2.0 license](http://www.apache.org/licenses/LICENSE-2.0.html).

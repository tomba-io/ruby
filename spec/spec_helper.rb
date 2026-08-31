# frozen_string_literal: true

require 'dotenv'
Dotenv.load

require 'tomba'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.order = :random
  Kernel.srand config.seed
end

# Helper to build a stubbed client for unit tests.
# Returns a Tomba::Client instance with a stubbed #call method.
def build_stubbed_client(response = {})
  client = Tomba::Client.new
  client.set_key('test-key')
  client.set_secret('test-secret')
  allow(client).to receive(:call).and_return(response)
  client
end

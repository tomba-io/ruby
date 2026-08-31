# frozen_string_literal: true

RSpec.describe Tomba::Domain do
  let(:response) { { 'data' => { 'emails' => [] } } }
  let(:client) { build_stubbed_client(response) }
  subject { described_class.new(client) }

  describe '#domain_search' do
    it 'calls GET /domain-search/ with domain param' do
      result = subject.domain_search(domain: 'example.com')
      expect(client).to have_received(:call).with(
        'get', '/domain-search/',
        { 'content-type' => 'application/json' },
        { domain: 'example.com' }
      )
      expect(result).to eq(response)
    end

    it 'passes optional page, limit, and department params' do
      subject.domain_search(domain: 'example.com', page: 2, limit: 10, department: 'engineering')
      expect(client).to have_received(:call).with(
        'get', '/domain-search/',
        { 'content-type' => 'application/json' },
        { domain: 'example.com', page: 2, limit: 10, department: 'engineering' }
      )
    end

    it 'raises when domain is nil' do
      expect { subject.domain_search(domain: nil) }.to raise_error(Tomba::Exception)
    end
  end
end

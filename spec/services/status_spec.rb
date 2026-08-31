# frozen_string_literal: true

RSpec.describe Tomba::Status do
  let(:response) { { 'data' => {} } }
  let(:client) { build_stubbed_client(response) }
  subject { described_class.new(client) }

  describe '#domain_status' do
    it 'calls GET /domain-status with domain param' do
      subject.domain_status(domain: 'example.com')
      expect(client).to have_received(:call).with(
        'get', '/domain-status',
        { 'content-type' => 'application/json' },
        { domain: 'example.com' }
      )
    end

    it 'raises when domain is nil' do
      expect { subject.domain_status(domain: nil) }.to raise_error(Tomba::Exception)
    end
  end

  describe '#auto_complete' do
    it 'calls GET /domain-suggestions with query param' do
      subject.auto_complete(query: 'goo')
      expect(client).to have_received(:call).with(
        'get', '/domain-suggestions',
        { 'content-type' => 'application/json' },
        { query: 'goo' }
      )
    end

    it 'raises when query is nil' do
      expect { subject.auto_complete(query: nil) }.to raise_error(Tomba::Exception)
    end
  end
end

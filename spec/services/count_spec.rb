# frozen_string_literal: true

RSpec.describe Tomba::Count do
  let(:response) { { 'data' => { 'total' => 100 } } }
  let(:client) { build_stubbed_client(response) }
  subject { described_class.new(client) }

  describe '#email_count' do
    it 'calls GET /email-count with domain param' do
      subject.email_count(domain: 'example.com')
      expect(client).to have_received(:call).with(
        'get', '/email-count',
        { 'content-type' => 'application/json' },
        { domain: 'example.com' }
      )
    end

    it 'raises when domain is nil' do
      expect { subject.email_count(domain: nil) }.to raise_error(Tomba::Exception)
    end
  end
end

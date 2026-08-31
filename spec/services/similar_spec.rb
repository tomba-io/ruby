# frozen_string_literal: true

RSpec.describe Tomba::Similar do
  let(:response) { { 'data' => [] } }
  let(:client) { build_stubbed_client(response) }
  subject { described_class.new(client) }

  describe '#websites' do
    it 'calls GET /similar with domain param' do
      subject.websites('example.com')
      expect(client).to have_received(:call).with(
        'get', '/similar',
        { 'content-type' => 'application/json' },
        { domain: 'example.com' }
      )
    end

    it 'raises when domain is nil' do
      expect { subject.websites(nil) }.to raise_error(Tomba::Exception)
    end
  end
end

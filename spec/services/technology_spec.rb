# frozen_string_literal: true

RSpec.describe Tomba::Technology do
  let(:response) { { 'data' => [] } }
  let(:client) { build_stubbed_client(response) }
  subject { described_class.new(client) }

  describe '#list' do
    it 'calls GET /technology with domain param' do
      subject.list('example.com')
      expect(client).to have_received(:call).with(
        'get', '/technology',
        { 'content-type' => 'application/json' },
        { domain: 'example.com' }
      )
    end

    it 'raises when domain is nil' do
      expect { subject.list(nil) }.to raise_error(Tomba::Exception)
    end
  end
end

# frozen_string_literal: true

RSpec.describe Tomba::Location do
  let(:response) { { 'data' => { 'country' => 'US' } } }
  let(:client) { build_stubbed_client(response) }
  subject { described_class.new(client) }

  describe '#get_location' do
    it 'calls GET /location with domain param' do
      subject.get_location('example.com')
      expect(client).to have_received(:call).with(
        'get', '/location',
        { 'content-type' => 'application/json' },
        { domain: 'example.com' }
      )
    end

    it 'raises when domain is nil' do
      expect { subject.get_location(nil) }.to raise_error(Tomba::Exception)
    end
  end
end

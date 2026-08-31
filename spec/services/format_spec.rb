# frozen_string_literal: true

RSpec.describe Tomba::Format do
  let(:response) { { 'data' => { 'format' => 'first.last' } } }
  let(:client) { build_stubbed_client(response) }
  subject { described_class.new(client) }

  describe '#email_format' do
    it 'calls GET /email-format with domain param' do
      subject.email_format('example.com')
      expect(client).to have_received(:call).with(
        'get', '/email-format',
        { 'content-type' => 'application/json' },
        { domain: 'example.com' }
      )
    end

    it 'raises when domain is nil' do
      expect { subject.email_format(nil) }.to raise_error(Tomba::Exception)
    end
  end
end

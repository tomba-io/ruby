# frozen_string_literal: true

RSpec.describe Tomba::Sources do
  let(:response) { { 'data' => { 'sources' => [] } } }
  let(:client) { build_stubbed_client(response) }
  subject { described_class.new(client) }

  describe '#email_sources' do
    it 'calls GET /email-sources with email as query param' do
      subject.email_sources(email: 'test@example.com')
      expect(client).to have_received(:call).with(
        'get', '/email-sources',
        { 'content-type' => 'application/json' },
        { email: 'test@example.com' }
      )
    end

    it 'raises when email is nil' do
      expect { subject.email_sources(email: nil) }.to raise_error(Tomba::Exception)
    end
  end
end

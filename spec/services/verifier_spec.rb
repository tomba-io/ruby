# frozen_string_literal: true

RSpec.describe Tomba::Verifier do
  let(:response) { { 'data' => { 'status' => 'valid' } } }
  let(:client) { build_stubbed_client(response) }
  subject { described_class.new(client) }

  describe '#email_verifier' do
    it 'calls GET /email-verifier with email as query param' do
      subject.email_verifier(email: 'test@example.com')
      expect(client).to have_received(:call).with(
        'get', '/email-verifier',
        { 'content-type' => 'application/json' },
        { email: 'test@example.com' }
      )
    end

    it 'raises when email is nil' do
      expect { subject.email_verifier(email: nil) }.to raise_error(Tomba::Exception)
    end
  end
end

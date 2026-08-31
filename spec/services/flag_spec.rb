# frozen_string_literal: true

RSpec.describe Tomba::Flag do
  let(:response) { { 'data' => {} } }
  let(:client) { build_stubbed_client(response) }
  subject { described_class.new(client) }

  describe '#list_flags' do
    it 'calls GET /flags' do
      subject.list_flags
      expect(client).to have_received(:call).with(
        'get', '/flags', { 'content-type' => 'application/json' }, {}
      )
    end
  end

  describe '#create_flag' do
    it 'calls POST /flags with email param' do
      subject.create_flag(email: 'test@example.com')
      expect(client).to have_received(:call).with(
        'post', '/flags',
        { 'content-type' => 'application/json' },
        { email: 'test@example.com' }
      )
    end

    it 'passes optional reason' do
      subject.create_flag(email: 'test@example.com', reason: 'spam')
      expect(client).to have_received(:call).with(
        'post', '/flags',
        { 'content-type' => 'application/json' },
        { email: 'test@example.com', reason: 'spam' }
      )
    end

    it 'raises when email is nil' do
      expect { subject.create_flag(email: nil) }.to raise_error(Tomba::Exception)
    end
  end
end

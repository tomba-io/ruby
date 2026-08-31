# frozen_string_literal: true

RSpec.describe Tomba::Account do
  let(:response) { { 'data' => { 'email' => 'test@example.com' } } }
  let(:client) { build_stubbed_client(response) }
  subject { described_class.new(client) }

  describe '#get_account' do
    it 'calls GET /me' do
      result = subject.get_account
      expect(client).to have_received(:call).with('get', '/me', { 'content-type' => 'application/json' }, {})
      expect(result).to eq(response)
    end
  end
end

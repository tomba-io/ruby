# frozen_string_literal: true

RSpec.describe Tomba::Logs do
  let(:response) { { 'data' => [] } }
  let(:client) { build_stubbed_client(response) }
  subject { described_class.new(client) }

  describe '#get_logs' do
    it 'calls GET /logs' do
      subject.get_logs
      expect(client).to have_received(:call).with('get', '/logs', { 'content-type' => 'application/json' }, {})
    end
  end
end

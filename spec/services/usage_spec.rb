# frozen_string_literal: true

RSpec.describe Tomba::Usage do
  let(:response) { { 'data' => {} } }
  let(:client) { build_stubbed_client(response) }
  subject { described_class.new(client) }

  describe '#get_usage' do
    it 'calls GET /usage' do
      subject.get_usage
      expect(client).to have_received(:call).with('get', '/usage', { 'content-type' => 'application/json' }, {})
    end
  end
end

# frozen_string_literal: true

RSpec.describe Tomba::Keys do
  let(:response) { { 'data' => {} } }
  let(:client) { build_stubbed_client(response) }
  subject { described_class.new(client) }

  describe '#get_keys' do
    it 'calls GET /keys (not /keys/{id})' do
      subject.get_keys
      expect(client).to have_received(:call).with('get', '/keys', { 'content-type' => 'application/json' }, {})
    end
  end

  describe '#create_key' do
    it 'calls POST /keys (not /keys/{id})' do
      subject.create_key
      expect(client).to have_received(:call).with('post', '/keys', { 'content-type' => 'application/json' }, {})
    end
  end

  describe '#delete_key' do
    it 'calls DELETE /keys/:id' do
      subject.delete_key(id: 'abc123')
      expect(client).to have_received(:call).with(
        'delete', '/keys/abc123', { 'content-type' => 'application/json' }, {}
      )
    end

    it 'raises when id is nil' do
      expect { subject.delete_key(id: nil) }.to raise_error(Tomba::Exception)
    end
  end

  describe '#reset_key' do
    it 'calls PUT /keys/:id' do
      subject.reset_key(id: 'abc123')
      expect(client).to have_received(:call).with(
        'put', '/keys/abc123', { 'content-type' => 'application/json' }, {}
      )
    end

    it 'raises when id is nil' do
      expect { subject.reset_key(id: nil) }.to raise_error(Tomba::Exception)
    end
  end
end

# frozen_string_literal: true

RSpec.describe Tomba::Bulk do
  let(:response) { { 'data' => {} } }
  let(:client) { build_stubbed_client(response) }
  subject { described_class.new(client) }

  describe '#list' do
    it 'calls GET /bulk/:type' do
      subject.list('search')
      expect(client).to have_received(:call).with(
        'get', '/bulk/search', { 'content-type' => 'application/json' }, {}
      )
    end

    it 'passes optional query params' do
      subject.list('search', params: { page: 2 })
      expect(client).to have_received(:call).with(
        'get', '/bulk/search',
        { 'content-type' => 'application/json' },
        { page: 2 }
      )
    end

    it 'raises when type is nil' do
      expect { subject.list(nil) }.to raise_error(Tomba::Exception)
    end
  end

  describe '#get' do
    it 'calls GET /bulk/:type/:id' do
      subject.get('search', '123')
      expect(client).to have_received(:call).with(
        'get', '/bulk/search/123', { 'content-type' => 'application/json' }, {}
      )
    end

    it 'raises when type is nil' do
      expect { subject.get(nil, '123') }.to raise_error(Tomba::Exception)
    end

    it 'raises when id is nil' do
      expect { subject.get('search', nil) }.to raise_error(Tomba::Exception)
    end
  end

  describe '#create' do
    it 'calls POST /bulk/:type with data' do
      subject.create('search', { name: 'test' })
      expect(client).to have_received(:call).with(
        'post', '/bulk/search',
        { 'content-type' => 'application/json' },
        { name: 'test' }
      )
    end

    it 'raises when type is nil' do
      expect { subject.create(nil, {}) }.to raise_error(Tomba::Exception)
    end
  end

  describe '#launch' do
    it 'calls POST /bulk/:type/:id/launch' do
      subject.launch('search', '123')
      expect(client).to have_received(:call).with(
        'post', '/bulk/search/123/launch', { 'content-type' => 'application/json' }, {}
      )
    end
  end

  describe '#delete' do
    it 'calls DELETE /bulk/:type/:id' do
      subject.delete('search', '123')
      expect(client).to have_received(:call).with(
        'delete', '/bulk/search/123', { 'content-type' => 'application/json' }, {}
      )
    end
  end

  describe '#archive' do
    it 'calls POST /bulk/:type/:id/archive' do
      subject.archive('search', '123')
      expect(client).to have_received(:call).with(
        'post', '/bulk/search/123/archive', { 'content-type' => 'application/json' }, {}
      )
    end
  end

  describe '#rename' do
    it 'calls PUT /bulk/:type/:id/rename with name' do
      subject.rename('search', '123', 'new-name')
      expect(client).to have_received(:call).with(
        'put', '/bulk/search/123/rename',
        { 'content-type' => 'application/json' },
        { name: 'new-name' }
      )
    end

    it 'raises when name is nil' do
      expect { subject.rename('search', '123', nil) }.to raise_error(Tomba::Exception)
    end
  end

  describe '#progress' do
    it 'calls GET /bulk/:type/:id/progress' do
      subject.progress('search', '123')
      expect(client).to have_received(:call).with(
        'get', '/bulk/search/123/progress', { 'content-type' => 'application/json' }, {}
      )
    end
  end

  describe '#download' do
    it 'calls GET /bulk/:type/:id/download' do
      subject.download('search', '123')
      expect(client).to have_received(:call).with(
        'get', '/bulk/search/123/download', { 'content-type' => 'application/json' }, {}
      )
    end
  end
end

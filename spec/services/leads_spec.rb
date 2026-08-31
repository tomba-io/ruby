# frozen_string_literal: true

RSpec.describe Tomba::Leads do
  let(:response) { { 'data' => {} } }
  let(:client) { build_stubbed_client(response) }
  subject { described_class.new(client) }

  describe '#list_leads' do
    it 'calls GET /leads with no params by default' do
      subject.list_leads
      expect(client).to have_received(:call).with(
        'get', '/leads', { 'content-type' => 'application/json' }, {}
      )
    end

    it 'passes optional page and limit params' do
      subject.list_leads(page: 2, limit: 25)
      expect(client).to have_received(:call).with(
        'get', '/leads',
        { 'content-type' => 'application/json' },
        { page: 2, limit: 25 }
      )
    end
  end

  describe '#get_lead' do
    it 'calls GET /leads/:id' do
      subject.get_lead('abc')
      expect(client).to have_received(:call).with(
        'get', '/leads/abc', { 'content-type' => 'application/json' }, {}
      )
    end

    it 'raises when id is nil' do
      expect { subject.get_lead(nil) }.to raise_error(Tomba::Exception)
    end
  end

  describe '#create_lead' do
    it 'calls POST /leads with data' do
      subject.create_lead(email: 'test@example.com', first_name: 'John')
      expect(client).to have_received(:call).with(
        'post', '/leads',
        { 'content-type' => 'application/json' },
        { email: 'test@example.com', first_name: 'John' }
      )
    end
  end

  describe '#update_lead' do
    it 'calls PUT /leads/:id with data' do
      subject.update_lead('abc', first_name: 'Jane')
      expect(client).to have_received(:call).with(
        'put', '/leads/abc',
        { 'content-type' => 'application/json' },
        { first_name: 'Jane' }
      )
    end

    it 'raises when id is nil' do
      expect { subject.update_lead(nil, first_name: 'Jane') }.to raise_error(Tomba::Exception)
    end
  end

  describe '#delete_lead' do
    it 'calls DELETE /leads/:id' do
      subject.delete_lead('abc')
      expect(client).to have_received(:call).with(
        'delete', '/leads/abc', { 'content-type' => 'application/json' }, {}
      )
    end

    it 'raises when id is nil' do
      expect { subject.delete_lead(nil) }.to raise_error(Tomba::Exception)
    end
  end
end

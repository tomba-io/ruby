# frozen_string_literal: true

RSpec.describe Tomba::LeadsLists do
  let(:response) { { 'data' => {} } }
  let(:client) { build_stubbed_client(response) }
  subject { described_class.new(client) }

  describe '#get_lists' do
    it 'calls GET /leads_lists (not /leads_lists/{id})' do
      subject.get_lists
      expect(client).to have_received(:call).with(
        'get', '/leads_lists', { 'content-type' => 'application/json' }, {}
      )
    end
  end

  describe '#create_list' do
    it 'calls POST /leads_lists (not /leads_lists/{id})' do
      subject.create_list
      expect(client).to have_received(:call).with(
        'post', '/leads_lists', { 'content-type' => 'application/json' }, {}
      )
    end
  end

  describe '#delete_list_id' do
    it 'calls DELETE /leads_lists/:id' do
      subject.delete_list_id(id: '42')
      expect(client).to have_received(:call).with(
        'delete', '/leads_lists/42', { 'content-type' => 'application/json' }, {}
      )
    end

    it 'raises when id is nil' do
      expect { subject.delete_list_id(id: nil) }.to raise_error(Tomba::Exception)
    end
  end

  describe '#update_list_id' do
    it 'calls PUT /leads_lists/:id' do
      subject.update_list_id(id: '42')
      expect(client).to have_received(:call).with(
        'put', '/leads_lists/42', { 'content-type' => 'application/json' }, {}
      )
    end

    it 'raises when id is nil' do
      expect { subject.update_list_id(id: nil) }.to raise_error(Tomba::Exception)
    end
  end
end

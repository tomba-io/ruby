# frozen_string_literal: true

RSpec.describe Tomba::LeadsAttributes do
  let(:response) { { 'data' => {} } }
  let(:client) { build_stubbed_client(response) }
  subject { described_class.new(client) }

  describe '#get_lead_attributes' do
    it 'calls GET /leads/attributes (not /leads/attributes/{id})' do
      subject.get_lead_attributes
      expect(client).to have_received(:call).with(
        'get', '/leads/attributes', { 'content-type' => 'application/json' }, {}
      )
    end
  end

  describe '#create_lead_attribute' do
    it 'calls POST /leads/attributes (not /leads/attributes/{id})' do
      subject.create_lead_attribute
      expect(client).to have_received(:call).with(
        'post', '/leads/attributes', { 'content-type' => 'application/json' }, {}
      )
    end
  end

  describe '#delete_lead_attribute' do
    it 'calls DELETE /leads/attributes/:id' do
      subject.delete_lead_attribute(id: '7')
      expect(client).to have_received(:call).with(
        'delete', '/leads/attributes/7', { 'content-type' => 'application/json' }, {}
      )
    end

    it 'raises when id is nil' do
      expect { subject.delete_lead_attribute(id: nil) }.to raise_error(Tomba::Exception)
    end
  end

  describe '#update_lead_attribute' do
    it 'calls PUT /leads/attributes/:id' do
      subject.update_lead_attribute(id: '7')
      expect(client).to have_received(:call).with(
        'put', '/leads/attributes/7', { 'content-type' => 'application/json' }, {}
      )
    end

    it 'raises when id is nil' do
      expect { subject.update_lead_attribute(id: nil) }.to raise_error(Tomba::Exception)
    end
  end
end

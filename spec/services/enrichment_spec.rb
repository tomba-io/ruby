# frozen_string_literal: true

RSpec.describe Tomba::Enrichment do
  let(:response) { { 'data' => {} } }
  let(:client) { build_stubbed_client(response) }
  subject { described_class.new(client) }

  describe '#person' do
    it 'calls GET /enrichment/person with email param' do
      subject.person('test@example.com')
      expect(client).to have_received(:call).with(
        'get', '/enrichment/person',
        { 'content-type' => 'application/json' },
        { email: 'test@example.com' }
      )
    end

    it 'raises when email is nil' do
      expect { subject.person(nil) }.to raise_error(Tomba::Exception)
    end
  end

  describe '#company' do
    it 'calls GET /enrichment/company with domain param' do
      subject.company('example.com')
      expect(client).to have_received(:call).with(
        'get', '/enrichment/company',
        { 'content-type' => 'application/json' },
        { domain: 'example.com' }
      )
    end

    it 'raises when domain is nil' do
      expect { subject.company(nil) }.to raise_error(Tomba::Exception)
    end
  end

  describe '#combined' do
    it 'calls GET /enrichment/combined with email param' do
      subject.combined('test@example.com')
      expect(client).to have_received(:call).with(
        'get', '/enrichment/combined',
        { 'content-type' => 'application/json' },
        { email: 'test@example.com' }
      )
    end

    it 'raises when email is nil' do
      expect { subject.combined(nil) }.to raise_error(Tomba::Exception)
    end
  end
end

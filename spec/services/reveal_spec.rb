# frozen_string_literal: true

RSpec.describe Tomba::Reveal do
  let(:response) { { 'data' => [] } }
  let(:client) { build_stubbed_client(response) }
  subject { described_class.new(client) }

  describe '#companies_search' do
    it 'calls GET /reveal with params' do
      subject.companies_search({ query: 'tech' })
      expect(client).to have_received(:call).with(
        'get', '/reveal',
        { 'content-type' => 'application/json' },
        { query: 'tech' }
      )
    end

    it 'raises when params is nil' do
      expect { subject.companies_search(nil) }.to raise_error(Tomba::Exception)
    end

    it 'raises when params is empty' do
      expect { subject.companies_search({}) }.to raise_error(Tomba::Exception)
    end
  end
end

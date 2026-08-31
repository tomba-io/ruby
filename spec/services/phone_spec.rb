# frozen_string_literal: true

RSpec.describe Tomba::Phone do
  let(:response) { { 'data' => {} } }
  let(:client) { build_stubbed_client(response) }
  subject { described_class.new(client) }

  describe '#finder' do
    it 'calls GET /phone-finder with query params' do
      subject.finder({ email: 'test@example.com' })
      expect(client).to have_received(:call).with(
        'get', '/phone-finder',
        { 'content-type' => 'application/json' },
        { email: 'test@example.com' }
      )
    end

    it 'raises when params is nil' do
      expect { subject.finder(nil) }.to raise_error(Tomba::Exception)
    end

    it 'raises when params is empty' do
      expect { subject.finder({}) }.to raise_error(Tomba::Exception)
    end
  end

  describe '#validator' do
    it 'calls GET /phone-validator with phone param' do
      subject.validator('+14155552671')
      expect(client).to have_received(:call).with(
        'get', '/phone-validator',
        { 'content-type' => 'application/json' },
        { phone: '+14155552671' }
      )
    end

    it 'passes optional country_code' do
      subject.validator('+14155552671', country_code: 'US')
      expect(client).to have_received(:call).with(
        'get', '/phone-validator',
        { 'content-type' => 'application/json' },
        { phone: '+14155552671', country_code: 'US' }
      )
    end

    it 'raises when phone is nil' do
      expect { subject.validator(nil) }.to raise_error(Tomba::Exception)
    end
  end
end

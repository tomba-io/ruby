# frozen_string_literal: true

RSpec.describe Tomba::Finder do
  let(:response) { { 'data' => { 'email' => 'john@example.com' } } }
  let(:client) { build_stubbed_client(response) }
  subject { described_class.new(client) }

  describe '#email_finder' do
    it 'calls GET /email-finder with domain, first_name, last_name' do
      subject.email_finder(domain: 'example.com', first_name: 'John', last_name: 'Doe')
      expect(client).to have_received(:call).with(
        'get', '/email-finder',
        { 'content-type' => 'application/json' },
        { domain: 'example.com', first_name: 'John', last_name: 'Doe' }
      )
    end

    it 'raises when domain is nil' do
      expect { subject.email_finder(domain: nil, first_name: 'J', last_name: 'D') }.to raise_error(Tomba::Exception)
    end

    it 'raises when first_name is nil' do
      expect { subject.email_finder(domain: 'x.com', first_name: nil, last_name: 'D') }.to raise_error(Tomba::Exception)
    end

    it 'raises when last_name is nil' do
      expect { subject.email_finder(domain: 'x.com', first_name: 'J', last_name: nil) }.to raise_error(Tomba::Exception)
    end
  end

  describe '#author_finder' do
    it 'calls GET /author-finder with url' do
      subject.author_finder(url: 'https://blog.example.com/post')
      expect(client).to have_received(:call).with(
        'get', '/author-finder',
        { 'content-type' => 'application/json' },
        { url: 'https://blog.example.com/post' }
      )
    end

    it 'raises when url is nil' do
      expect { subject.author_finder(url: nil) }.to raise_error(Tomba::Exception)
    end
  end

  describe '#linkedin_finder' do
    it 'calls GET /linkedin-finder with url' do
      subject.linkedin_finder(url: 'https://linkedin.com/in/johndoe')
      expect(client).to have_received(:call).with(
        'get', '/linkedin-finder',
        { 'content-type' => 'application/json' },
        { url: 'https://linkedin.com/in/johndoe' }
      )
    end

    it 'raises when url is nil' do
      expect { subject.linkedin_finder(url: nil) }.to raise_error(Tomba::Exception)
    end
  end

  describe '#phone_finder' do
    it 'calls GET /phone-finder with email as query param' do
      subject.phone_finder(email: 'john@example.com')
      expect(client).to have_received(:call).with(
        'get', '/phone-finder',
        { 'content-type' => 'application/json' },
        { email: 'john@example.com' }
      )
    end

    it 'raises when email is nil' do
      expect { subject.phone_finder(email: nil) }.to raise_error(Tomba::Exception)
    end
  end
end

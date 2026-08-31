# frozen_string_literal: true

require File.expand_path('lib/tomba/version', __dir__)

Gem::Specification.new do |gem|
  gem.name = 'tomba'
  gem.summary = 'Tomba.io is an Email Finder for B2B sales and email marketing'
  gem.description = 'official Ruby library for Tomba'
  gem.author = ['Mohamed Ben rebia', 'Tomba technology web service LLC']
  gem.homepage = 'https://tomba.io'
  gem.license = 'Apache-2.0'
  gem.email = ['b.mohamed@tomba.io', 'info@tomba.io']
  gem.files = Dir['lib/**/*.rb']
  gem.required_ruby_version = '>= 2.5.0'
  gem.require_paths = ['lib']
  gem.version       = Tomba::VERSION
  gem.metadata['rubygems_mfa_required'] = 'true'
end

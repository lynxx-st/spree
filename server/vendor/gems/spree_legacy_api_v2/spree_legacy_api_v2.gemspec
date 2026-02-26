# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'spree_legacy_api_v2/version'

Gem::Specification.new do |s|
  s.name          = 'spree_legacy_api_v2'
  s.version       = SpreeLegacyApiV2::VERSION
  s.authors       = ['Ryan Bigg', 'Spark Solutions Sp. z o.o.', 'Vendo Connect Inc.']
  s.email         = ['hello@spreecommerce.org']
  s.summary       = "Spree's Legacy API v2"
  s.description   = 'Legacy API v2 endpoints for Spree Commerce.'
  s.homepage      = 'https://spreecommerce.org'
  s.licenses      = ['AGPL-3.0-or-later', 'BSD-3-Clause']

  s.metadata = {
    'bug_tracker_uri' => 'https://github.com/spree/spree_legacy_api_v2/issues',
    'changelog_uri' => "https://github.com/spree/spree_legacy_api_v2/releases/tag/v#{s.version}",
    'documentation_uri' => 'https://docs.spreecommerce.org/',
    'source_code_uri' => "https://github.com/spree/spree_legacy_api_v2/tree/v#{s.version}"
  }

  s.required_ruby_version = '>= 3.2'

  s.files = Dir['{app,config,db,lib,vendor}/**/*', 'LICENSE.md', 'Rakefile', 'README.md'].reject do |f|
    f.match(/^spec/) && !f.match(%r{^spec/fixtures})
  end
  s.require_paths = ['lib']

  s.add_development_dependency 'jsonapi-rspec'
  s.add_development_dependency 'multi_json'

  s.add_dependency 'doorkeeper', '~> 5.3'
  s.add_dependency 'jsonapi-serializer', '~> 2.1'
  s.add_dependency 'pagy', '~> 43.0'

  s.add_dependency 'spree', '>= 5.4.0.alpha'
end

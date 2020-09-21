# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Add more helper methods to be used by all tests here...
end

require 'vcr'

VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = false
  config.cassette_library_dir = File.expand_path('fixtures/vcr_cassettes', __dir__)
  config.hook_into :webmock
  config.ignore_request { ENV['DISABLE_VCR'] }
  config.ignore_localhost = true
  config.default_cassette_options = {
    record: :new_episodes
  }
  config.filter_sensitive_data('<CONTENTFUL_AT>') { ENV['CONTENTFUL_ACCESS_TOKEN'] }
  config.filter_sensitive_data('<CONTENTFUL_SI>') { ENV['CONTENTFUL_SPACE_ID'] }
  config.filter_sensitive_data('<CONTENTFUL_EI>') { ENV['CONTENTFUL_ENV_ID'] }
end

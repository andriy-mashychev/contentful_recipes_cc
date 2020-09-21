# frozen_string_literal: true

# Client services for external APIs
module ContentfulApi
  require 'contentful'

  # See https://github.com/contentful/contentful.rb for more details.
  class ClientService
    def initialize(sdk_class: Contentful::Client, arguments: {})
      @sdk_class = sdk_class
      @access_token = arguments[:access_token] || ENV['CONTENTFUL_ACCESS_TOKEN']
      @space_id = arguments[:space_id] || ENV['CONTENTFUL_SPACE_ID']
      @environment_id = arguments[:environment_id] || ENV['CONTENTFUL_ENV_ID']
    end

    def fetch_items
      connection.entries
    end

    def fetch_item(item_id)
      connection.entry(item_id)
    end

    def fetch_recipes
      connection.entries(content_type: :recipe)
    end

    private

    attr_reader :access_token, :space_id, :environment_id, :sdk_class

    def connection
      @connection ||= sdk_class.new(
        access_token: access_token,
        environment: environment_id,
        space: space_id,
        dynamic_entries: :auto,
        raise_errors: true,
        raise_for_empty_fields: false
      )
    end
  end
end

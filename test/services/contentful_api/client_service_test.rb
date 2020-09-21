# frozen_string_literal: true

require 'test_helper'
require 'minitest/mock'

module ContentfulApi
  class ClientServiceTest < ActiveSupport::TestCase
    attr_reader :client, :auth_args, :entry_id, :mock

    setup do
      @auth_args = {
        access_token: '4587ghewf9f',
        space_id: '8974zfu23',
        environment_id: 'staging'
      }
      @client = ClientService.new(arguments: @auth_args)
      @entry_id = '09k340k302f302jf03jf4'
      @mock = MiniTest::Mock.new
    end

    test '#fetch_recipes' do
      mock.expect :entries, [], [{ content_type: :recipe }]

      Contentful::Client.stub :new, check_args_and_mock(mock) do
        client.fetch_recipes
      end

      assert_mock mock
    end

    test '#fetch_item' do
      mock.expect :entry, nil, [entry_id]

      Contentful::Client.stub :new, check_args_and_mock(mock) do
        client.fetch_item entry_id
      end

      assert_mock mock
    end

    def check_args_and_mock(mock_obj)
      lambda do |access_token:, space:, environment:, dynamic_entries:, raise_errors:, raise_for_empty_fields:|
        assert_equal(access_token, auth_args[:access_token])
        assert_equal(space, auth_args[:space_id])
        assert_equal(environment, auth_args[:environment_id])
        assert_equal(dynamic_entries, :auto)
        assert_equal(raise_errors, true)
        assert_equal(raise_for_empty_fields, false)

        mock_obj
      end
    end
  end
end

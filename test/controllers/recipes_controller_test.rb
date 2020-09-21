# frozen_string_literal: true

require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    VCR.use_cassette('recipes_index_1') do
      get recipes_url
      assert_response :success
    end
  end

  test 'should show recipe' do
    VCR.use_cassette('recipes_show_2') do
      get recipe_url(id: '2E8bc3VcJmA8OgmQsageas')
      assert_response :success
    end
  end
end

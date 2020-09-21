# frozen_string_literal: true

require 'test_helper'

module Recipes
  class IndexFacadeTest < ActiveSupport::TestCase
    attr_reader :index_facade

    def setup
      @index_facade = Recipes::IndexFacade.new
    end

    test '#all' do
      VCR.use_cassette('recipes_index_1') do
        recipes = index_facade.all

        recipes.each do |r|
          assert_respond_to r, :title
          assert_respond_to r, :image
          assert_respond_to r, :list_of_tags
          assert_respond_to r, :description
          assert_respond_to r, :chef_name
        end

        assert_equal recipes.first.title,
                     'White Cheddar Grilled Cheese with Cherry Preserves & Basil'
        assert_equal recipes.first.image,
                     '//images.ctfassets.net/kk2bw5ojx476/61XHcqOBFYAYCGsKugoMYK/0009ec560684b37f7f7abadd66680179/SKU1240_hero-374f8cece3c71f5fcdc939039e00fb96.jpg?w=510&h=340'
        assert_equal recipes.first.list_of_tags, ['vegan']
        assert_equal recipes.first.description,
                     '*Grilled Cheese 101*: Use delicious cheese and good quality bread; make crunchy on the outside and ooey gooey on the inside; add one or two ingredients for a flavor punch! In this case, cherry preserves serve as a sweet contrast to cheddar cheese, and basil adds a light, refreshing note. Use __mayonnaise__ on the outside of the bread to achieve the ultimate, crispy, golden-brown __grilled cheese__. Cook, relax, and enjoy!'
        assert_nil recipes.first.chef_name
      end
    end
  end
end

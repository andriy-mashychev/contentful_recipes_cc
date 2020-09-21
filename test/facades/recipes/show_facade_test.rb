# frozen_string_literal: true

require 'test_helper'

module Recipes
  class ShowFacadeTest < ActiveSupport::TestCase
    attr_reader :show_facade, :id_param

    def setup
      @show_facade = Recipes::ShowFacade.new
      @id_param = '437eO3ORCME46i02SeCW46'
    end

    test '#find' do
      VCR.use_cassette('recipes_show_1') do
        recipe = show_facade.find(id_param)

        assert_equal recipe.title, "Crispy Chicken and Rice\twith Peas & Arugula Salad"
        assert_equal recipe.image,
                     '//images.ctfassets.net/kk2bw5ojx476/5mFyTozvSoyE0Mqseoos86/fb88f4302cfd184492e548cde11a2555/SKU1479_Hero_077-71d8a07ff8e79abcb0e6c0ebf0f3b69c.jpg?w=510&h=340'
        assert_equal recipe.list_of_tags, ['gluten free', 'healthy']
        assert_equal recipe.description,
                     'Crispy chicken skin, tender meat, and rich, tomatoey sauce form a winning trifecta of delicious in this one-pot braise. We spoon it over rice and peas to soak up every last drop of goodness, and serve a tangy arugula salad alongside for a vibrant boost of flavor and color. Dinner is served! Cook, relax, and enjoy!'
        assert_equal recipe.chef_name, 'Jony Chives'
      end
    end
  end
end

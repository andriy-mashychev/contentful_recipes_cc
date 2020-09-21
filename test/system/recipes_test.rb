# frozen_string_literal: true

require 'application_system_test_case'

class RecipesTest < ApplicationSystemTestCase
  test 'visiting the index' do
    VCR.use_cassette('recipes_index_1') do
      visit recipes_url

      assert_selector 'h1', text: 'Recipes'
      assert_selector 'th', text: 'Title'
      assert_selector 'th', text: 'Image'

      assert_selector 'td', text: 'White Cheddar Grilled Cheese with Cherry Preserves & Basil'
      assert_selector 'td', text: 'Tofu Saag Paneer with Buttery Toasted Pita'
      assert_selector 'td', text: 'Grilled Steak & Vegetables with Cilantro-Jalapeño Dressing'
      assert_selector 'td', text: 'Crispy Chicken and Rice with Peas & Arugula Salad'

      assert_xpath "//img[(@src='//images.ctfassets.net/kk2bw5ojx476/61XHcqOBFYAYCGsKugoMYK/0009ec560684b37f7f7abadd66680179/SKU1240_hero-374f8cece3c71f5fcdc939039e00fb96.jpg?w=510&h=340')]"
      assert_xpath "//img[(@src='//images.ctfassets.net/kk2bw5ojx476/48S44TRZN626y4Wy4CuOmA/9c0a510bc3d18dda9318c6bf49fac327/SKU1498_Hero_154__2_-adb6124909b48c69f869afecb78b6808-2.jpg?w=510&h=340')]"
      assert_xpath "//img[(@src='//images.ctfassets.net/kk2bw5ojx476/3TJp6aDAcMw6yMiE82Oy0K/2a4cde3c1c7e374166dcce1e900cb3c1/SKU1503_Hero_102__1_-6add52eb4eec83f785974ddeac3316b7.jpg?w=510&h=340')]"
      assert_xpath "//img[(@src='//images.ctfassets.net/kk2bw5ojx476/5mFyTozvSoyE0Mqseoos86/fb88f4302cfd184492e548cde11a2555/SKU1479_Hero_077-71d8a07ff8e79abcb0e6c0ebf0f3b69c.jpg?w=510&h=340')]"
    end
  end

  test 'visiting the show from the index' do
    VCR.use_cassette('recipes_index_1') do
      visit recipes_url
    end

    VCR.use_cassette('recipes_show_1') do
      click_on 'Crispy Chicken and Rice with Peas & Arugula Salad'

      assert_text 'Title: Crispy Chicken and Rice with Peas & Arugula Salad'
      assert_text 'Image:'
      assert_xpath "//img[(@src='//images.ctfassets.net/kk2bw5ojx476/5mFyTozvSoyE0Mqseoos86/fb88f4302cfd184492e548cde11a2555/SKU1479_Hero_077-71d8a07ff8e79abcb0e6c0ebf0f3b69c.jpg?w=510&h=340')]"
      assert_text 'List of tags: gluten free, healthy'
      assert_text 'Description: Crispy chicken skin, tender meat, and rich, tomatoey sauce form a winning trifecta of delicious in this one-pot braise. We spoon it over rice and peas to soak up every last drop of goodness, and serve a tangy arugula salad alongside for a vibrant boost of flavor and color. Dinner is served! Cook, relax, and enjoy!'
      assert_text 'Chef name: Jony Chives'
    end
  end
end

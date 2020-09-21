# frozen_string_literal: true

# Facades of the recipes controller
module Recipes
  # Own facade of the index controller action
  class IndexFacade < Base
    def all
      api_client.fetch_recipes.map { |recipe| adapt recipe }
    end
  end
end

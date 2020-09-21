# frozen_string_literal: true

# Facades of the recipes controller
module Recipes
  # Own facade of the index controller action
  class ShowFacade < Base
    def find(id)
      adapt api_client.fetch_item(id)
    end
  end
end

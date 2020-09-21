# frozen_string_literal: true

module Recipes
  class Base
    def initialize(
      api_service_class: ContentfulApi::ClientService,
      recipe_adapter_class: ContentfulApi::RecipeFromContentful
    )
      @api_service_class = api_service_class
      @recipe_adapter_class = recipe_adapter_class
    end

    protected

    attr_reader :api_service_class, :recipe_adapter_class

    def adapt(item)
      recipe_adapter_class.new(item)
    end

    def api_client
      @api_client ||= api_service_class.new
    end
  end
end

# frozen_string_literal: true

# Client services for external APIs
module ContentfulApi
  # Adapter for Contentful::Entry[recipe]
  class RecipeFromContentful
    def initialize(recipe_entry)
      @recipe_entry = recipe_entry
    end

    def id
      @id ||= recipe_entry.id
    end

    def chef_name
      @chef_name ||= recipe_entry.chef&.name
    end

    def description
      @description ||= recipe_entry.description
    end

    def image(width: 510, height: 340)
      @image ||= recipe_entry.photo.url(width: width, height: height)
    end

    def list_of_tags
      @list_of_tags ||= recipe_entry.tags&.map(&:name) || []
    end

    def title
      @title ||= recipe_entry.title
    end

    protected

    attr_accessor :recipe_entry
  end
end

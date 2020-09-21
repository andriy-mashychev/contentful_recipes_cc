json.extract! recipe, :id, :title, :image, :list_of_tags, :description, :chef_name
json.url recipe_url(recipe, format: :json)

class RecipesController < ApplicationController
  # Authentication is not require so it is also possible to use the faster page caching.
  caches_action :index, :show, expires_in: 5.minutes

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipes::IndexFacade.new.all
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe = Recipes::ShowFacade.new.find(params[:id])
  end

  private

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:title, :image, :list_of_tags, :description, :chef_name)
  end
end

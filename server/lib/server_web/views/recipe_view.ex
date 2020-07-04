defmodule RecipeBoxWeb.RecipeView do
  use RecipeBoxWeb, :view
  alias RecipeBoxWeb.RecipeView

  def render("index.json", %{recipes: recipes}) do
    %{data: render_many(recipes, RecipeView, "recipe.json")}
  end

  def render("show.json", %{recipe: recipe}) do
    %{data: render_one(recipe, RecipeView, "recipe.json")}
  end

  def render("recipe.json", %{recipe: recipe}) do
    # Map.drop(recipe, [:author, :inserted_at, :updated_at])
    recipe
  end

  def render("error.json", %{error: changeset}) do
    Ecto.Changeset.traverse_errors(changeset, &translate_error/1)
  end
end

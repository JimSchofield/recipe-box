defmodule RecipeBoxWeb.RecipeController do
  use RecipeBoxWeb, :controller

  alias RecipeBox.Recipes
  alias RecipeBox.Recipes.Recipe

  import RecipeBoxWeb.Auth, only: [ authenticate: 2 ]
  action_fallback RecipeBoxWeb.FallbackController

  plug(:authenticate when action in [ :create, :update, :delete ])

  def index(conn, _params) do
    recipes = Recipes.list_recipes()
    render(conn, "index.json", recipes: recipes)
  end

  def create(conn, {:ok, %Recipe{} = recipe}) do
    conn
    |> put_status(:created)
    |> render("show.json", recipe: recipe)
  end

  def create(conn, {:error, changeset}) do
    conn
    |> put_status(400)
    |> render("error.json", error: changeset)
  end

  def create(conn, %{} = recipe_params) do
    recipe = recipe_params
    |> Map.put("author_id", conn.assigns.current_user.id)
    |> Recipes.create_recipe  
    create(conn, recipe)
  end

  def create(conn, _params), do: send_resp(conn, 400, "Expected valid JSON, and we didn't get it.")

  def show(conn, %{"id" => id}) do
    recipe = Recipes.get_recipe!(id)
    render(conn, "show.json", recipe: recipe)
  end

  def update(conn, %{"id" => id, "recipe" => recipe_params}) do
    recipe = Recipes.get_recipe!(id)

    with {:ok, %Recipe{} = recipe} <- Recipes.update_recipe(recipe, recipe_params) do
      render(conn, "show.json", recipe: recipe)
    end
  end

  def delete(conn, %{"id" => id}) do
    recipe = Recipes.get_recipe!(id)

    with {:ok, %Recipe{}} <- Recipes.delete_recipe(recipe) do
      send_resp(conn, :no_content, "")
    end
  end
end

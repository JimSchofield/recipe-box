defmodule RecipeBoxWeb.RecipeBoxHello do
  use RecipeBoxWeb, :controller

  def index(conn, _params) do
    render(conn, "hello.json")
  end
end

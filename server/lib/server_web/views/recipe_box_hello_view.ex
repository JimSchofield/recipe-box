defmodule RecipeBoxWeb.RecipeBoxHelloView do
  use RecipeBoxWeb, :view

  def render("hello.json", _) do
    %{ hello: "world" }
  end
end

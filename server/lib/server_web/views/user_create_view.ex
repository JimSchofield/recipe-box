defmodule RecipeBoxWeb.UserView do
  use RecipeBoxWeb, :view

  def render("user.json", %{user: user}) do
    %{
      status: "OK",
      user: %{
        first_name: user.first_name,
        last_name: user.last_name,
        email: user.email,
      },
    }
  end

  def render("error.json", %{reasons: reasons}) do
    %{
      status: "BAD",
      reasons: Ecto.Changeset.traverse_errors(reasons, &translate_error/1)
    }
  end
end

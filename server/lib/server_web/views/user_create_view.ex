defmodule RecipeBoxWeb.UserView do
  use RecipeBoxWeb, :view

  def render("user.json", user) do
    user_response = Map.drop(user.conn.body_params, ["password"])
    %{
      status: "OK",
      user: user_response,
    }
  end
end

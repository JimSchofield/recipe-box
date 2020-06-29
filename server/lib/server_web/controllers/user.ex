defmodule RecipeBoxWeb.UserController do
  use RecipeBoxWeb, :controller
  alias RecipeBox.User

  def create(conn, params) do
    case User.create_user(params) do
      { :ok, _rest } -> render(conn, "user.json")
      { :error, reasons } ->
        IO.inspect(reasons)
        conn
      _ -> nil
    end
  end
end

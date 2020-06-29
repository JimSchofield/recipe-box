defmodule RecipeBoxWeb.UserController do
  use RecipeBoxWeb, :controller
  alias RecipeBox.User

  def create(conn, params) do
    case User.create_user(params) do
      { :ok, %User{} = rest } ->
        conn
        |> put_status(:created)
        |> render("user.json", user: rest)
      { :error, reasons } ->
        conn
        |> put_status(400)
        |> render("error.json", reasons: reasons)
      _ -> nil
    end
  end
end

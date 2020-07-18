defmodule RecipeBoxWeb.UserController do
  use RecipeBoxWeb, :controller
  alias RecipeBox.Accounts

  def create(conn, params) do
    case Accounts.create_account(params) do
      { :ok, %Accounts.User{} = rest } ->
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

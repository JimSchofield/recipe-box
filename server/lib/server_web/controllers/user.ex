defmodule RecipeBoxWeb.UserController do
  use RecipeBoxWeb, :controller
  alias RecipeBox.Accounts

  def create(conn, params) do
    case Accounts.create_account(params) do
      { :ok, %Accounts.User{} = user } ->
        conn
        |> put_status(:created)
        |> put_session(:user_id, user.id)
        |> render("user.json", user: user)
      { :error, reasons } ->
        conn
        |> put_status(400)
        |> render("error.json", reasons: reasons)
      _ -> nil
    end
  end

  def login(conn, params) do
    case Accounts.login_user(params) do
      { :ok, %Accounts.User{} = user } ->
        conn
        |> put_session(:user_id, user.id)
        |> send_resp(200, "")
      { :error, _reasons } ->
        conn
        |> send_resp(401, "Sorry, bub")
    end
  end

  def logout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> send_resp(200, "User logged out")
  end

end

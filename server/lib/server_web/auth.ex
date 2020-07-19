defmodule RecipeBoxWeb.Auth do
  alias RecipeBox.Accounts
  import Plug.Conn

  def init(options), do: options

  def call(conn, _options) do
    user_id = get_session(conn, :user_id)
    user = user_id && RecipeBox.Accounts.get_user(user_id)
    assign(conn, :current_user, user)
  end

  def authenticate(%{assigns: %{ current_user: %Accounts.User{} }} = conn, _options), do: conn
  def authenticate(conn, _options), do: send_resp(conn, 401, "")
end

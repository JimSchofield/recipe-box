defmodule RecipeBox.Accounts do
  alias RecipeBox.Accounts.User
  
  alias RecipeBox.Repo

  def get_user(user_id), do: Repo.get(User, user_id)

  def create_account(attrs) do
    %User {}
    |> User.changeset(attrs)
    |> Repo.insert 
  end

  def login_user(params \\ %{})
  def login_user(%{ "email" => email, "password" => password }) do
    email
    |> get_user_by_email
    |> Argon2.check_pass(password, hash_key: :password)
  end
  def login_user(params) do
    %{ "email" => "fake123", "password" => "password123" }
    |> Map.merge(params)
    |> login_user
  end

  defp get_user_by_email(email), do: Repo.get_by(User, email: email)
end

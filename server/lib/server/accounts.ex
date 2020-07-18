defmodule RecipeBox.Accounts do
  alias RecipeBox.Accounts.User
  
  alias RecipeBox.Repo

  def create_account(attrs) do
    %User {}
    |> User.changeset(attrs)
    |> Repo.insert 
  end
end

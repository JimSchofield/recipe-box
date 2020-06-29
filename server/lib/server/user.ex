defmodule RecipeBox.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias __MODULE__
  alias RecipeBox.Repo

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :password, :string
    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :password])
    |> validate_required([:first_name, :last_name, :email, :password])
    |> unique_constraint(:email)
  end

  def create_user(attrs) do
    %User {}
    |> changeset(attrs)
    |> Repo.insert 
  end
end

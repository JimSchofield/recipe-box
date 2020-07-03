defmodule RecipeBox.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias RecipeBox.Repo
  alias RecipeBox.Recipes.Recipe

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :password, :string

    # Because we called the field :author on the other side
    # we have to manually specify the foreign_key: as
    # :author_id here.
    #
    # By default has_many will look for the name of this table
    # with _id post fixed. In this case :user_id
   has_many(:recipes, Recipe, foreign_key: :author_id)

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :password])
    |> validate_required([:first_name, :last_name, :email, :password])
    |> unique_constraint(:email)
  end

  def create_user(attrs) do
    %__MODULE__ {}
    |> changeset(attrs)
    |> Repo.insert 
  end
end

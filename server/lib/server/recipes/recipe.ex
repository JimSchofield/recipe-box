defmodule RecipeBox.Recipes.Recipe do
  use Ecto.Schema
  import Ecto.Changeset
  alias RecipeBox.User

  schema "recipes" do
    field :title, :string
    belongs_to(:author, User)

    timestamps()
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:title])
    |> validate_required([:title, :author])
  end
end

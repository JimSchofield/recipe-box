defmodule RecipeBox.Recipes.Ingredient do
  use Ecto.Schema
  import Ecto.Changeset
  @fields [:quantity, :label, :name]

  embedded_schema do
    field :quantity, :string
    field :label, :string
    field :name, :string
  end

  def changeset(ingredient, attrs) do
    ingredient
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end

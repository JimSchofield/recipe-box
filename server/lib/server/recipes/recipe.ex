defmodule RecipeBox.Recipes.Recipe do
  use Ecto.Schema
  import Ecto.Changeset
  alias RecipeBox.User
  @required [:title, :author_id]
  @optional [:ingredients, :instructions, :notes, :prep_time, :picture_url]

  @derive {Jason.Encoder, only: @required ++ @optional}
  schema "recipes" do
    field :title, :string
    embeds_many :ingredients, RecipeBox.Recipes.Ingredient
    field :instructions, { :array, :string }
    field :notes, :string
    field :prep_time, :string
    field :picture_url, :string 

    # belongs_to/2 sets the :foreign_key option to `name`_id.
    # In this case :author_id, which relates to the field
    # we created in the migration.
    #
    # This needs to match the foreign_key in the has_many/3
    # call in the User model.
    belongs_to(:author, User)

    timestamps()
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, @required ++ @optional -- [ :ingredients ])
    |> cast_embed(:ingredients)
    |> validate_required(@required)
  end

end

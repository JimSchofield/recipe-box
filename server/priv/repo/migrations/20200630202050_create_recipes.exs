defmodule RecipeBox.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :title, :string

      # previously this was just named `author`, but the field should be the id
      # of the relationship. We will give the primary_key of the associated
      # table and Ecto will be able to fetch that record based on that
      # information
      add :author_id, references("users", on_delete: :nothing)

      timestamps()
    end

    create index(:recipes, [:author_id])
  end
end

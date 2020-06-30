defmodule RecipeBox.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :title, :string
      add :author, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:recipes, [:author])
  end
end

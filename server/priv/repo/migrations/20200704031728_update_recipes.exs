defmodule RecipeBox.Repo.Migrations.UpdateRecipes do
  use Ecto.Migration

  def change do
    alter table(:recipes) do
      add :ingredients, {:array, :map}, default: []
      add :instructions, {:array, :string}, default: []
      add :notes, :text
      add :prep_time, :string
      add :picture_url, :string 
    end
  end
end

defmodule SportBackend.Repo.Migrations.CreateExercise do
  use Ecto.Migration

  def change do
    create table(:exercises) do
      add :title, :string
      add :power_rating, :integer
      add :progression_reps, :integer
      add :progression_sets, :integer

      timestamps
    end

  end
end

defmodule SportBackend.ExerciseView do
  use JaSerializer.PhoenixView

  attributes [:title, :power_rating, :progression_reps, :progression_sets]
end

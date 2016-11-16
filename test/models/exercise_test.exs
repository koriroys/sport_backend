defmodule SportBackend.ExerciseTest do
  use SportBackend.ModelCase

  alias SportBackend.Exercise

  @valid_attrs %{power_rating: 42, progression_reps: 42, progression_sets: 42, title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Exercise.changeset(%Exercise{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Exercise.changeset(%Exercise{}, @invalid_attrs)
    refute changeset.valid?
  end
end

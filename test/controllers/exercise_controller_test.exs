defmodule SportBackend.ExerciseControllerTest do
  use SportBackend.ConnCase

  alias SportBackend.Exercise
  @valid_attrs power_rating: 42, progression_reps: 42, progression_sets: 42, title: "some content"
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/vnd.api+json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, exercise_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    exercise = Repo.insert! %Exercise{}
    conn = get conn, exercise_path(conn, :show, exercise)
    assert json_response(conn, 200)["data"] ==
      %{
        "id" => "#{exercise.id}",
        "type" => "exercise",
        "attributes" => %{
          "title" => exercise.title,
          "power-rating" => exercise.power_rating,
          "progression-reps" => exercise.progression_reps,
          "progression-sets" => exercise.progression_sets
        }
      }
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, exercise_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, exercise_path(conn, :create), exercise: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Exercise, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, exercise_path(conn, :create), exercise: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    exercise = Repo.insert! %Exercise{}
    conn = put conn, exercise_path(conn, :update, exercise), exercise: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Exercise, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    exercise = Repo.insert! %Exercise{}
    conn = put conn, exercise_path(conn, :update, exercise), exercise: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    exercise = Repo.insert! %Exercise{}
    conn = delete conn, exercise_path(conn, :delete, exercise)
    assert response(conn, 204)
    refute Repo.get(Exercise, exercise.id)
  end
end

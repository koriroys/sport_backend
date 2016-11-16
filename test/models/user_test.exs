defmodule SportBackend.UserTest do
  use SportBackend.ModelCase

  alias SportBackend.User

  @valid_attrs %{email: "email@example.com", password: "password", password_confirmation: "password"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "password_confirmation must match" do
    changeset = User.changeset(%User{}, %{email: "me@example.com",
      password: "12341234",
      password_confirmation: "abcdabcd"})
    refute changeset.valid?
  end

  test "password_confirmation must be present" do
    changeset = User.changeset(%User{}, %{email: "me@example.com",
      password: "12341234"})
    refute changeset.valid?
  end

  test "password must be certain length" do
    changeset = User.changeset(%User{}, %{email: "me@example.com",
      password: "abc",
      password_confirmation: "abc"})
    refute changeset.valid?
  end
end

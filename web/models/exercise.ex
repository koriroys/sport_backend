defmodule SportBackend.Exercise do
  use SportBackend.Web, :model

  schema "exercises" do
    field :title, :string
    field :power_rating, :integer
    field :progression_reps, :integer
    field :progression_sets, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :power_rating, :progression_reps, :progression_sets])
    |> validate_required([:title, :power_rating, :progression_reps, :progression_sets])
  end
end

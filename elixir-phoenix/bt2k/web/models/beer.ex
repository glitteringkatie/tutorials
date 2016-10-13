defmodule Bt2k.Beer do
  use Bt2k.Web, :model

  schema "beers" do
    field :name, :string
    field :brewery, :string
    field :description, :string
    field :year, :integer
    field :abv, :float
    field :ibu, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :brewery, :description, :year, :abv, :ibu])
    |> validate_required([:name, :brewery, :description, :year])
  end
end

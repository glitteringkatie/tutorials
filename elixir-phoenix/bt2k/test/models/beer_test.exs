defmodule Bt2k.BeerTest do
  use Bt2k.ModelCase

  alias Bt2k.Beer

  @valid_attrs %{brewery: "some content", description: "some content", name: "some content", year: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Beer.changeset(%Beer{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Beer.changeset(%Beer{}, @invalid_attrs)
    refute changeset.valid?
  end
end

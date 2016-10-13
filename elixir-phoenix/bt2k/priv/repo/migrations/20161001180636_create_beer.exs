defmodule Bt2k.Repo.Migrations.CreateBeer do
  use Ecto.Migration

  def change do
    create table(:beers) do
      add :name, :string
      add :brewery, :string
      add :description, :string
      add :year, :integer

      timestamps()
    end

  end
end

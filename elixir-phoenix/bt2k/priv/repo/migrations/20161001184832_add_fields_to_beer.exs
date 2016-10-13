defmodule Bt2k.Repo.Migrations.AddFieldsToBeer do
  use Ecto.Migration

  def change do
    alter table(:beers) do
      add :ibu, :integer
      add :abv, :float
    end
  end
end

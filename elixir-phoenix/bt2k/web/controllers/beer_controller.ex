defmodule Bt2k.BeerController do
  use Bt2k.Web, :controller

  alias Bt2k.Beer

  def index(conn, _params) do
    beers = Repo.all(Beer)
    render(conn, "index.html", beers: beers)
  end

  def new(conn, _params) do
    changeset = Beer.changeset(%Beer{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"beer" => beer_params}) do
    changeset = Beer.changeset(%Beer{}, beer_params)

    case Repo.insert(changeset) do
      {:ok, _beer} ->
        conn
        |> put_flash(:info, "Beer created successfully.")
        |> redirect(to: beer_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    beer = Repo.get!(Beer, id)
    render(conn, "show.html", beer: beer)
  end

  def edit(conn, %{"id" => id}) do
    beer = Repo.get!(Beer, id)
    changeset = Beer.changeset(beer)
    render(conn, "edit.html", beer: beer, changeset: changeset)
  end

  def update(conn, %{"id" => id, "beer" => beer_params}) do
    beer = Repo.get!(Beer, id)
    changeset = Beer.changeset(beer, beer_params)

    case Repo.update(changeset) do
      {:ok, beer} ->
        conn
        |> put_flash(:info, "Beer updated successfully.")
        |> redirect(to: beer_path(conn, :show, beer))
      {:error, changeset} ->
        render(conn, "edit.html", beer: beer, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    beer = Repo.get!(Beer, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(beer)

    conn
    |> put_flash(:info, "Beer deleted successfully.")
    |> redirect(to: beer_path(conn, :index))
  end
end

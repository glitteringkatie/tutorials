defmodule Bt2k.ChannelCase do
  @moduledoc """
  This module defines the test case to be used by
  channel tests.

  Such tests rely on `Phoenix.ChannelTest` and also
  import other functionality to make it easier
  to build and query models.

  Finally, if the test case interacts with the database,
  it cannot be async. For this reason, every test runs
  inside a transaction which is reset at the beginning
  of the test unless the test case is marked as async.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      # Import conveniences for testing with channels
      use Phoenix.ChannelTest

      alias Bt2k.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query


      # The default endpoint for testing
      @endpoint Bt2k.Endpoint
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Bt2k.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Bt2k.Repo, {:shared, self()})
    end

    :ok
  end
end

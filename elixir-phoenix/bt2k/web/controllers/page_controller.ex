defmodule Bt2k.PageController do
  use Bt2k.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
  def about(conn, _params) do
    # underscore shows that you won't be using it but you know
    # what it is called. otherwise compiler will complain about
    # unused var
    render conn, "about.html"
  end
end

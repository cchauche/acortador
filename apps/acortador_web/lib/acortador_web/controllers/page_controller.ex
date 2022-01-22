defmodule AcortadorWeb.PageController do
  use AcortadorWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

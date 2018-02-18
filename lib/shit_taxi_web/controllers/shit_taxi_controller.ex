defmodule ShitTaxiWeb.ShitTaxiController do
  use ShitTaxiWeb, :controller

  alias ShitTaxi.ShitTaxiReport

  def index(conn, _params) do
    render conn, "index.html"
  end

end

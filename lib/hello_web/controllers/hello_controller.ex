defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  alias Hello.ShitTaxiReport
  alias Hello.Repo

  def index(conn, _params) do
    changeset = ShitTaxiReport.changeset(%ShitTaxiReport{}, _params)
    render conn, "index.html", changeset: changeset
  end

  def show(conn, %{"messenger" => messenger}) do
    render conn, "show.html", messenger: messenger
  end

  def create(conn, %{"shit_taxi_report" => shit_taxi_report }) do
    changeset = ShitTaxiReport.changeset(%ShitTaxiReport{}, shit_taxi_report)
    if changeset.valid? do
      result = Repo.insert(changeset.data)
    else
      render conn, "show.html", messenger: inspect(changeset.data)
    end
      case result do
        {:ok, x} ->
          render conn, "show.html", messenger: "success"
        _ ->
          render conn, "show.html", messenger: "error"
      end
  end

end

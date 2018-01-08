defmodule ShitTaxiWeb.ShitTaxiController do
  use ShitTaxiWeb, :controller

  alias ShitTaxi.ShitTaxiReport
  alias ShitTaxi.Repo

  def index(conn, _params) do
    changeset = ShitTaxiReport.changeset(%ShitTaxiReport{}, %{})
    render conn, "index.html", changeset: changeset
  end

  def create(conn, %{"shit_taxi_report" => shit_taxi_report }) do
    cs = ShitTaxiReport.changeset(%ShitTaxiReport{}, shit_taxi_report)
    case Repo.insert(cs) do
      {:ok, report} ->
        conn
        |> put_flash(:info, "\##{report.id} created")
        |> redirect(to: shit_taxi_path(conn, :index))
      {:error, error}->
        IO.inspect error
        render conn, "index.html", changeset: error
    end
  end

  def show(conn, _params) do
    Repo.all(ShitTaxiReport)
    # shit_taxi_reports = [%{id: "foo"}, %{id: "bar"}]
    render conn, "all.json", shit_taxi_reports: Repo.all(ShitTaxiReport)
  end
  def one(conn, _params) do
    # Repo.all(ShitTaxiReport)
    shit_taxi_report = %{id: "foo"}
    render conn, "show.json", shit_taxi_report: shit_taxi_report
  end
end

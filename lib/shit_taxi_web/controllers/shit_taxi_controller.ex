defmodule ShitTaxiWeb.ShitTaxiController do
  use ShitTaxiWeb, :controller

  alias ShitTaxi.ShitTaxiReport
  alias ShitTaxi.Repo
  alias ShitTaxi.ErrorView

  def index(conn, _params) do
    changeset = ShitTaxiReport.changeset(%ShitTaxiReport{}, %{})
    render conn, "index.html", changeset: changeset
  end

  def create(conn, %{"shit_taxi_report" => shit_taxi_report }) do
    cs = ShitTaxiReport.changeset(%ShitTaxiReport{}, shit_taxi_report)
    case Repo.insert(cs) do
      {:ok, report} ->
        conn
          |> put_status(:no_content)
          |> send_resp
      {:error, error}->
        IO.inspect error.errors
        # put_status(conn, :unprocessable_entity)
        conn
          |> put_view(ShitTaxiWeb.ErrorView)
          |> render "422.json", error: error.errors
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

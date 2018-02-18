defmodule ShitTaxiWeb.ReportController do
  use ShitTaxiWeb, :controller

  alias ShitTaxi.ShitTaxiReport
  alias ShitTaxi.Repo

  def create(conn, %{"shit_taxi_report" => shit_taxi_report }) do
    cs = ShitTaxiReport.changeset(%ShitTaxiReport{}, shit_taxi_report)
    case Repo.insert(cs) do
      {:ok, _} ->
        conn
        |> send_resp(:no_content, "")
      {:error, error}->
        conn
        |> put_view(ShitTaxiWeb.ErrorView)
        |> put_status(:unprocessable_entity)
        |> render("422.json", error: error)
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


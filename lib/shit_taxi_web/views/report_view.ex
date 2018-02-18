defmodule ShitTaxiWeb.ReportView do
  use ShitTaxiWeb, :view

  def render("all.json", %{shit_taxi_reports: shit_taxi_reports}) do
    render_many(shit_taxi_reports, ShitTaxiWeb.ReportView, "one.json")
  end

  def render("show.json", %{shit_taxi_report: shit_taxi_report}) do
    render_one(shit_taxi_report, ShitTaxiWeb.ReportView, "one.json")
  end

  def render("one.json", %{report: report}) do
    %{
      id: report.id,
      updatedAt: report.updated_at,
      lat: report.lat,
      lon: report.lon,
      licensePlate: report.license_plate,
      type: report.type
    }
  end
end

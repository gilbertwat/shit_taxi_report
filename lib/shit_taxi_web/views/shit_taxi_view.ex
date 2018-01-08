defmodule ShitTaxiWeb.ShitTaxiView do
  use ShitTaxiWeb, :view

  def render("all.json", %{shit_taxi_reports: shit_taxi_reports}) do
    render_many(shit_taxi_reports, ShitTaxiWeb.ShitTaxiView, "one.json")
  end

  def render("show.json", %{shit_taxi_report: shit_taxi_report}) do
    render_one(shit_taxi_report, ShitTaxiWeb.ShitTaxiView, "one.json")
  end

  def render("one.json", %{shit_taxi: shit_taxi_report}) do
    %{ id: shit_taxi_report.id }
  end
end

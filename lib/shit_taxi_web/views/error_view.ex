defmodule ShitTaxiWeb.ErrorView do
  use ShitTaxiWeb, :view

  def render("404.html", _assigns) do
    IO.inspect(_assigns)
    "Page not found"
  end

  def render("500.html", _assigns) do
    "Internal server error"
  end

  def render("422.json", %{error: error}) do
    IO.inspect(error)
    "ERROR"
  end

  # In case no render clause matches or no
  # template is found, let's render it as 500
  def template_not_found(_template, assigns) do
    render "500.html", assigns
  end
end

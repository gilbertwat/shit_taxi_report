
defmodule ShitTaxiWeb.ErrorView do
  use ShitTaxiWeb, :view

  def render("404.html", _assigns) do
    "Page not found"
  end

  def render("500.html", _assigns) do
    "Internal server error"
  end

  def render("422.json", %{error: error}) do
    result_key = Map.keys(Enum.into(error.errors, %{}))
    result = Enum.reduce(result_key, %{}, fn(key, result) ->
      Map.put(result,key, %{
          message: elem(error.errors[key], 0),
          extras: Enum.into(elem(error.errors[key], 1), %{})})
    end)
    result
  end

  # In case no render clause matches or no
  # template is found, let's render it as 500
  def template_not_found(_template, assigns) do
    render "500.html", assigns
  end
end

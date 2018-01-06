defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  alias Hello.ShitTaxiReport
  alias Hello.Repo

  def index(conn, _params) do
    changeset = ShitTaxiReport.changeset(%ShitTaxiReport{}, _params)
    render conn, "index.html", changeset: changeset
  end

  def show(conn, _params) do
    render conn, "show.html"
  end

  def create(conn, %{"shit_taxi_report" => shit_taxi_report }) do
    ShitTaxiReport.changeset(%ShitTaxiReport{}, shit_taxi_report) 
      |> 
        fn (cs) ->
          if cs.valid? do
            case Repo.insert(cs.data) do
              {:ok, x} ->
                render conn, "show.html", messenger: "success"
              _ ->
                render conn, "show.html", messenger: "error"
            end
          else
            render conn, "show.html", messenger: inspect(cs.data)
          end
        end.()
  end

end

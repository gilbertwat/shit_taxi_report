defmodule ShitTaxi.ShitTaxiReport do
  use Ecto.Schema
  import Ecto.Changeset
  alias ShitTaxi.ShitTaxiReport


  schema "shit_taxi_report" do
    field :lat, :float
    field :license_plate, :string
    field :lon, :float
    field :type, OffendTypes

    timestamps()
  end

  @doc false
  def changeset(%ShitTaxiReport{} = shit_taxi_report, attrs) do
    shit_taxi_report
    |> cast(attrs, [:license_plate, :type, :lat, :lon])
    |> validate_required([:license_plate, :type, :lat, :lon])
  end
end

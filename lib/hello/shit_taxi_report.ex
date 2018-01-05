defmodule Hello.ShitTaxiReport do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hello.ShitTaxiReport


  schema "shit_taxi_report" do
    field :lat, :integer
    field :license_plate, :string
    field :lon, :integer
    field :type, OffendTypes

    timestamps()
  end

  @doc false
  def changeset(%ShitTaxiReport{} = shit_taxi_report, attrs) do
    shit_taxi_report
    |> cast(attrs, [:license_plate, :type, :created_at, :lat, :lon])
    |> validate_required([:license_plate, :type, :created_at, :lat, :lon])
  end
end

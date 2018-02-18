defmodule ShitTaxi.Repo.Migrations.CreateShitTaxiReport do
  use Ecto.Migration

  def up do
    OffendTypes.create_type

    create table(:shit_taxi_report) do
      add :license_plate, :string
      add :type, :type
      add :lat, :float
      add :lon, :float

      timestamps()
    end

  end

  def down do
    drop table(:shit_taxi_report)
    OffendTypes.drop_type
  end
end

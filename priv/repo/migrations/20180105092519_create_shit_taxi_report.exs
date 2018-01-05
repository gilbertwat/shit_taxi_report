defmodule Hello.Repo.Migrations.CreateShitTaxiReport do
  use Ecto.Migration

  def up do
    OffendTypes.create_type

    create table(:shit_taxi_report) do
      add :license_plate, :string
      add :type, :type
      add :lat, :integer
      add :lon, :integer

      timestamps()
    end

  end

  def down do
    drop table(:shit_taxi_report)
    OffendTypes.drop_type
  end
end

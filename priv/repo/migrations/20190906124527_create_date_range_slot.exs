defmodule EctoDelete.Repo.Migrations.CreateDateRangeSlot do
  use Ecto.Migration

  def change do
    create table(:date_range_slots) do
      add :date_range_id, references(:date_ranges)
      add :time, :time, null: false

      timestamps()
    end
  end
end

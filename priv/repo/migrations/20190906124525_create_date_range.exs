defmodule EctoDelete.Repo.Migrations.CreateDateRange do
  use Ecto.Migration

  def change do
    create table(:date_ranges) do
      add :from, :date, null: false
      add :to, :date, null: false

      add :timetable_id, references(:timetable)

      timestamps()
    end
  end
end

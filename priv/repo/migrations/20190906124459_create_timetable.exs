defmodule EctoDelete.Repo.Migrations.CreateTimetable do
  use Ecto.Migration

  def change do
    create table(:timetable) do
      add :user_id, :integer, null: false

      timestamps()
    end
  end
end

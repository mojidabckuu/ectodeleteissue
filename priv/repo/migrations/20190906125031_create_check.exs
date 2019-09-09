defmodule EctoDelete.Repo.Migrations.CreateCheck do
  use Ecto.Migration

  def change do
    create table(:checks) do
      add :date_range_id, references(:date_ranges)
      add :date_range_slot_id, references(:date_range_slots)

      add :user_id, :integer, null: false

      timestamps()
    end
  end
end

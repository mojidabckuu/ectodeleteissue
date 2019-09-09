defmodule EctoDelete.DateRange do
  use Ecto.Schema

  import Ecto.Changeset

  schema "date_ranges" do
    belongs_to :timetable, EctoDelete.Timetable
    has_many :slots, EctoDelete.DateRangeSlot, on_replace: :delete

    field :from, :date
    field :to, :date

    timestamps()
  end

  def changeset(struct, attrs) do
    struct
    |> cast(attrs, [:from, :to])
    |> cast_assoc(:slots, required: true)
    |> validate_required([:from, :to])

    |> foreign_key_constraint(:timetable, name: :date_range_slots_date_range_id_fkey, message: "You can't delete this date range. You have checks")
  end

  def delete_changeset(struct_or_changeset) do
    struct_or_changeset
    |> foreign_key_constraint(:timetable, name: :date_range_slots_date_range_id_fkey, message: "You can't delete this date range. You have checks")
  end
end

defmodule EctoDelete.Timetable do
  use Ecto.Schema
  import Ecto.Changeset

  schema "timetable" do
    field :user_id, :integer
    has_many :date_ranges, EctoDelete.DateRange, on_replace: :delete

    timestamps()
  end

  def changeset(struct, attrs) do
    struct
    |> cast(attrs, [])
    |> cast_assoc(:date_ranges, required: true)
  end
end

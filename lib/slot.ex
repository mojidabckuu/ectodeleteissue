defmodule EctoDelete.DateRangeSlot do
  use Ecto.Schema

  import Ecto.Changeset

  schema "date_range_slots" do
    belongs_to :date_range, EctoDelete.DateRange

    field :time, :time

    timestamps()
  end

  def changeset(struct, attrs) do
    struct
    |> cast(attrs, [:time])
  end
end

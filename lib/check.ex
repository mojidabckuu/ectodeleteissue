defmodule EctoDelete.Check do
  use Ecto.Schema

  import Ecto.Changeset

  schema "checks" do
    belongs_to :date_range, EctoDelete.DateRange
    belongs_to :date_range_slot, EctoDelete.DateRangeSlot

    field :user_id, :integer

    timestamps()
  end

  def changeset(struct, attrs) do
    struct
    |> cast(attrs, [])
  end
end

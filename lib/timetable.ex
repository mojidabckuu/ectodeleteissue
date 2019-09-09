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

    |> put_date_ranges_delete_changeset()
  end

  def put_date_ranges_delete_changeset(changeset) do
    changeset
    |> update_change(:date_ranges, fn date_range_changesets ->
      case date_range_changesets do
        date_range_changesets when is_list(date_range_changesets) ->
          Enum.map(date_range_changesets, & EctoDelete.DateRange.delete_changeset(&1))
        _ -> date_range_changesets
      end
    end)
  end
end

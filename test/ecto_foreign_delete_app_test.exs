defmodule EctoForeignDeleteAppTest do
  use EctoDelete.DataCase

  import Factory

  setup context do
    context = context
      |> Map.put(:user_id, 1)
    {:ok, context}
  end

  test "delete foreign key test", %{user_id: user_id} do
    timetable = insert(:timetable, %{
      user_id: user_id,
      date_ranges: [
        build(:today_date_range, %{
          slots: [
            build(:now_date_range_slot)
          ]
        })
      ]
    })
    _check = insert(:check, %{
      date_range_id: List.first(timetable.date_ranges).id,
      date_range_id: List.first(List.first(timetable.date_ranges).slots).id,
      user_id: user_id
    })

    update_attrs = string_params_for(:timetable, %{
      date_ranges: [
        build(:tomorrow_date_range, %{
          slots: [
            build(:now_date_range_slot)
          ]
        })
      ]
    })

    IO.puts inspect(update_attrs)

    assert {:error, %Ecto.Changeset{} = changeset} = EctoDelete.TimetableManager.update_timetable(timetable, update_attrs)
    assert errors_on(changeset) == %{}
  end
end

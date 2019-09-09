defmodule EctoDelete.TimetableManager do
  alias EctoDelete.Repo

  alias EctoDelete.Timetable

  def update_timetable(timetable, attrs) do
    timetable
    |> Timetable.changeset(attrs)
    |> Repo.update()
  end
end

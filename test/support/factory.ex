defmodule Factory do
  use ExMachina.Ecto, repo: EctoDelete.Repo

  def check_factory do
    %EctoDelete.Check{}
  end

  def timetable_factory do
    %EctoDelete.Timetable{
      date_ranges: []
    }
  end

  def today_date_range_factory do
    %EctoDelete.DateRange{
      from: Date.utc_today(),
      to: Date.utc_today()
    }
  end

  def tomorrow_date_range_factory do
    %EctoDelete.DateRange{
      from: Date.add(Date.utc_today(), 1) |> Date.to_iso8601(),
      to: Date.add(Date.utc_today(), 1) |> Date.to_iso8601()
    }
  end

  def now_date_range_slot_factory do
    %EctoDelete.DateRangeSlot{
      time: Time.utc_now() |> Time.to_iso8601()
    }
  end
end

defmodule TimeAgo do
  @moduledoc """
  Module for getting the amount of days/hours/minutes/seconds since past a specific date
  """

  @doc """
  Returns tuple
  first value is the amount of days/hours/minutes/seconds
  seconds value is the unit as a atom

  ## Examples
        ###  original date
        iex> TimeAgo.from_date ~N[2019-12-10 23:00:00], ~N[2019-12-21 22:30:00]
        {~N[2019-12-10 23:00:00], :date}

        ### days
        iex> TimeAgo.from_date ~N[2019-12-18 12:00:00], ~N[2019-12-21 22:30:00]
        {3, :days}

        ### hours
        iex> TimeAgo.from_date ~N[2019-12-21 20:00:00], ~N[2019-12-21 22:30:00]
        {2, :hours}

        ### minutes
        iex> TimeAgo.from_date ~N[2019-12-21 18:00:00], ~N[2019-12-21 18:30:00]
        {30, :minutes}

        ### seconds
        iex> TimeAgo.from_date ~N[2019-12-21 13:00:00], ~N[2019-12-21 13:00:55]
        {55, :seconds}
  """
  @spec from_date(DateTime.t(), DateTime.t()) :: {number, atom}
  def from_date(first, last \\ DateTime.utc_now) do

    %{days: days, hours: hours, minutes: minutes, seconds: seconds} = calc_diff first, last
    
    cond do
      days > 7 -> {first, :date}
      days > 0 -> {days, :days}
      hours > 0 -> {hours, :hours}
      minutes > 0 -> {minutes, :minutes}
      seconds > 0 -> {seconds, :seconds}
    end
  end

  @spec calc_diff(DateTime.t(), DateTime.t()) :: map
  defp calc_diff(first, last) do
    diff_days = last.day - first.day
    diff_hours = last.hour - first.hour
    diff_minutes = last.minute - first.minute
    diff_seconds = last.second - first.second

    %{
      days: diff_days,
      hours: diff_hours,
      minutes: diff_minutes,
      seconds: diff_seconds
    }
  end
end

defmodule TimeAgo do
  @moduledoc """
  Module for getting the amount of days/hours/minutes/seconds since past a specific date.

  This module is inspired of functionality in many social networks
  """

  @doc """
  Returns tuple
  first value is the unit as an atom
  second value is the amount of days/hours/minutes/seconds

  second argument has the current time of UTC timezone as default value

  ## Examples
        # returns original date if amount of days are more than 7
        iex> TimeAgo.from_date ~N[2019-12-10 23:00:00], ~N[2019-12-21 22:30:00]
        {:date, ~N[2019-12-10 23:00:00]}

        # returns days if amount of days are more than 0
        iex> TimeAgo.from_date ~N[2019-12-18 12:00:00], ~N[2019-12-21 22:30:00]
        {:days, 3}

        # returns hours if amount of hours are more than 0
        iex> TimeAgo.from_date ~N[2019-12-21 20:00:00], ~N[2019-12-21 22:30:00]
        {:hours, 2}

        # returns minutes if amount of minutes are more than 0
        iex> TimeAgo.from_date ~N[2019-12-21 18:00:00], ~N[2019-12-21 18:30:00]
        {:minutes, 30}

        # returns seconds if amount of seconds are more than 0
        iex> TimeAgo.from_date ~N[2019-12-21 13:00:00], ~N[2019-12-21 13:00:55]
        {:seconds, 55}
  """
  @spec from_date(DateTime.t(), DateTime.t()) :: {number, atom}
  def from_date(first, last \\ DateTime.utc_now) do

    %{days: days, hours: hours, minutes: minutes, seconds: seconds} = calc_diff first, last
    
    cond do
      days > 7 -> {:date, first}
      days > 0 -> {:days, days}
      hours > 0 -> {:hours, hours}
      minutes > 0 -> {:minutes, minutes}
      seconds > 0 -> {:seconds, seconds}
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

# TimeAgo

Module for getting the amount of days/hours/minutes/seconds since past a specific date.
This module is inspired by the functionality of many social networks and forums

[![Build Status](https://travis-ci.com/pr0grammr/time-ago.svg?branch=master)](https://travis-ci.com/pr0grammr/time-ago)

<a href="https://hexdocs.pm/time_ago/TimeAgo.html#content" target="_blank" title="TimeAgo - Hex Docs">See Hex Docs</a>

## Installation

The package can be installed
by adding `time_ago` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:time_ago, "~> 0.1.1"}
  ]
end
```

## Usage

```elixir
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
```

## Pattern Matching

```elixir
case TimeAgo.from_date ~N[2019-12-21 20:00:00], ~N[2019-12-21 22:30:00] do
  {:days, days} ->
    IO.puts "#{days} days ago"
  {:hours, hours} ->
    IO.puts "#{hours} hours ago"
  {:minutes, minutes} ->
    IO.puts "#{minutes} minutes ago"
  {:seconds, seconds} ->
    IO.puts "#{seconds} seconds ago"
end

# => 2 hours ago
```

## License 

This module is published under the <a href="https://github.com/pr0grammr/time-ago/blob/master/LICENSE">MIT license</a>



defmodule TimeAgo.MixProject do
  use Mix.Project

  def project do
    [
      app: :time_ago,
      version: "1.0.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),

      # Docs
      name: "TimeAgo",
      source_url: "https://github.com/pr0grammr/time-ago"
    ]
  end

  defp description() do
    "Module for calculating the range of two datetimes and get the result as days/hours/minutes/seconds"
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package() do
    [
      name: "time_ago",
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/pr0grammr/time-ago"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.21", only: :dev, runtime: false}
    ]
  end
end

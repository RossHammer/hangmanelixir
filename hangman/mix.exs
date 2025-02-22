defmodule Hangman.MixProject do
  use Mix.Project

  def project do
    [
      app: :hangman,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Hangman.Runtime.Application, []},
      extra_applications: [:logger, :observer, :wx]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dictionary, path: "../dictionary"},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false}
    ]
  end
end

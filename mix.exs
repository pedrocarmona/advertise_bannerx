defmodule AdvertiseBannerx.Mixfile do
  use Mix.Project

  def project do
    [app: :advertise_bannerx,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :cowboy, :plug],
     mod: {AdvertiseBannerx, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  def deps do
  	[{:cowboy, "~> 1.0.0"},
  	 {:plug, "~> 1.0"},
     {:credo, "~> 0.4", only: [:dev, :test]}
     #{:mix_test_watch, "~> 0.2", only: :dev}
    ]
  end
end



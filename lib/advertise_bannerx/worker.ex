defmodule AdvertiseBannerx.Worker do
  def start_link do
    Plug.Adapters.Cowboy.http(
      AdvertiseBannerx.Router,
      [],
      port: Application.get_env(:advertise_bannerx, :port)
    )
  end
end
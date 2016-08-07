defmodule AdvertiseBannerx do
  use Application
  def start(_type, _args) do
    import Supervisor.Spec, warn: false
 
    children = [
      # Optional worker child for HelloWorld.run/0
      worker(__MODULE__, [], function: :run)
    ]
    opts = [strategy: :one_for_one, name: AdvertiseBannerx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def run do
    # Routes for our application
    routes = [
      {"/", AdvertiseBannerx.Handler, []}
    ]

    # Compile our routes so Cowboy knows
    # how to dispatch requests
    dispatch = :cowboy_router.compile([{:_, routes}])

    # Set some options
    opts = [port: 8080]
    env = [dispatch: dispatch]
    {:ok, _pid} = :cowboy.start_http(:http, 100, opts, [env: env])
  end
end
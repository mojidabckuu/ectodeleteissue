defmodule EctoDelete.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(EctoDelete.Repo, [])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EctoDelete.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

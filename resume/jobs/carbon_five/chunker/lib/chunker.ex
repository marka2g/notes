defmodule Chunker do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Chunker.Router, [])
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: HexVersionSupervisor)
  end
end

defmodule Lar.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    port = retrieve_port()

    children = []

    opts = [strategy: :one_for_one, name: Lar.Supervisor]

    with result = {:ok, _pid} <- Supervisor.start_link(children, opts) do
      IO.puts("\nServer running on port #{port}\n")
      result
    end
  end

  defp retrieve_port() do
    System.get_env("PORT", "4001")
    |> String.to_integer()
  end
end

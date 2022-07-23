defmodule Hello.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Hello.Worker.start_link(arg)
      # {Hello.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Hello.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def start_phase(:notify, :normal, options) do
    IO.puts "This is a #{options[:account]} notification"
    :ok
  end

  @impl true
  def start_phase(:send_email, :normal, options) do
    IO.puts "This is a #{options[:account]} notification"
    :ok
  end
end

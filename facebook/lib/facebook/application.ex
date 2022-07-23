defmodule Facebook.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Facebook.Worker.start_link(arg)
      # {Facebook.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Facebook.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def start_phase(:notify, :normal, options) do
    IO.puts("This is a #{options[:account]} notification")
    :ok
  end
  @impl true
  def start_phase(:send_email, :normal, options) do
    IO.puts("Sending email from #{options[:account]}")
    :ok
  end
end

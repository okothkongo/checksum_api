defmodule ChecksumApi.Server do
  use GenServer
  alias ChecksumApi.Core
  # Client

  def start_link({initial_state, server_name}) do
    GenServer.start_link(__MODULE__, initial_state, name: server_name)
  end

  def add_digits(digits) do
    GenServer.cast(:checksum_api, {:add_digits, digits})
  end

  def read() do
    GenServer.call(:checksum_api, :read)
  end

  # Server

  def init(current_digits) do
    {:ok, current_digits}
  end

  def handle_call(:read, _from, current_digits) do
    {:reply, current_digits, current_digits}
  end

  def handle_cast({:add_digits, digits}, current_digits) do
    {:noreply, Core.add_digits(current_digits, digits)}
  end
end

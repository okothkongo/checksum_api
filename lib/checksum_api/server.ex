defmodule ChecksumApi.Server do
  use GenServer
  alias ChecksumApi.Core

  def start_link({initial_state, server_name}) do
    GenServer.start_link(__MODULE__, initial_state, name: server_name)
  end

  def init(current_digits) do
    {:ok, current_digits}
  end

  def handle_call(:read, _from, current_digits) do
    {:reply, current_digits, current_digits}
  end

  def handle_cast({:add_digits, digits}, current_digits) do
    {:noreply, Core.add_digits(current_digits, digits)}
  end

  def handle_cast(:clear_digits, _current_digits) do
    {:noreply, Core.clear_digits()}
  end
end

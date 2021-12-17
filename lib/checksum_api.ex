defmodule ChecksumApi do
  @moduledoc """
  Documentation for `ChecksumApi`.
  """
  alias ChecksumApi.Core

  @spec add_digits(list(integer())) :: :ok
  def add_digits(digits) do
    GenServer.cast(:checksum_api, {:add_digits, digits})
  end

  @spec clear_digits :: :ok
  def clear_digits() do
    GenServer.cast(:checksum_api, :clear_digits)
  end

  @spec checksum() :: integer
  def checksum() do
    Core.checksum(read_current_sate())
  end

  defp read_current_sate() do
    GenServer.call(:checksum_api, :read)
  end
end

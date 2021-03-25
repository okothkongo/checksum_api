defmodule ChecksumApi do
  @moduledoc """
  Documentation for `ChecksumApi`.
  """
  alias ChecksumApi.Server
  alias ChecksumApi.Core

  @spec get_checksum :: integer
  def get_checksum() do
    Server.read()
    |> Core.checksum()
  end
end

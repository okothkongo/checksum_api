defmodule ChecksumApi do
  @moduledoc """
  Documentation for `ChecksumApi`.
  """

  def add_digits(digits) do
    GenServer.cast(:checksum_api, {:add_digits, digits})
  end

  def clear_digits() do
    GenServer.cast(:checksum_api, :clear_digits)
  end

  @spec checksum() :: integer
  def checksum() do
    read_current_sate()
    |> sum_of_odd_and_even()
    |> total_sum()
    |> rem(10)
    |> case do
      0 -> 0
      rem -> 10 - rem
    end
  end

  defp total_sum({odd, even}) do
    odd + even * 3
  end

  defp sum_of_odd_and_even(digits) do
    digits
    |> Enum.with_index()
    |> Enum.reduce({0, 0}, fn {value, index}, {odd, even} ->
      if rem(index, 2) == 0 do
        {odd, even + value}
      else
        {odd + value, even}
      end
    end)
  end

  defp read_current_sate() do
    GenServer.call(:checksum_api, :read)
  end
end

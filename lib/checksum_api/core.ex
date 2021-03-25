defmodule ChecksumApi.Core do
  @spec new :: []
  def new() do
    []
  end

  @doc """
  This takes list of integers and integer, appends the digits of given integer into list interger.Returning a single list.
  """
  @spec add_digits(list(integer()), integer()) ::
          list(integer())
  def add_digits(previous_digits, digits_be_add) do
    previous_digits ++ Integer.digits(digits_be_add)
  end

  def clear_digits() do
    []
  end

  @spec checksum(list(integer())) :: integer
  def checksum(digits) do
    digits
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
end

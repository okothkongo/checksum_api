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
end

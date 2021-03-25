defmodule ChecksumApi.CoreTest do
  use ExUnit.Case
  alias ChecksumApi.Core
  doctest ChecksumApi

  test "new/0 returns empty list" do
    assert Core.new() == []
  end

  test "add_digit/2 appends given digits to existing digits" do
    assert Core.add_digits([2], 34) == [2, 3, 4]
  end

  test "clear_digits/0 returns empty list" do
    assert Core.clear_digits() == []
  end
end

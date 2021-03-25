defmodule ChecksumApiTest do
  use ExUnit.Case

  test "checksum/1 returns  checksum integer" do
    ChecksumApi.add_digits(5_489_850_354)
    assert ChecksumApi.checksum() == 7
  end
end

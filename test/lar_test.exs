defmodule LarTest do
  use ExUnit.Case
  doctest Lar

  test "greets the world" do
    assert Lar.hello() == :world
  end
end

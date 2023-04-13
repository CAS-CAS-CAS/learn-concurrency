defmodule StringTownTest do
  use ExUnit.Case
  doctest StringTown

  test "greets the world" do
    assert StringTown.hello() == :world
  end
end

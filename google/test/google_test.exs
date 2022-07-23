defmodule GoogleTest do
  use ExUnit.Case
  doctest Google

  test "greets the world" do
    assert Google.hello() == :world
  end
end

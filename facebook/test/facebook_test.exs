defmodule FacebookTest do
  use ExUnit.Case
  doctest Facebook

  test "greets the world" do
    assert Facebook.hello() == :world
  end
end

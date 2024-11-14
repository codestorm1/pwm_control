defmodule PwmControlTest do
  use ExUnit.Case
  doctest PwmControl

  test "greets the world" do
    assert PwmControl.hello() == :world
  end
end

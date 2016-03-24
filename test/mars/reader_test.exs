defmodule Mars.ReaderTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "initial position with positive numbers" do
    capture_io("2 3", fn ->
      result = Mars.Reader.get_initial_position
      assert result == {2,3}
    end)
  end

  test "initial position with negative numbers" do
    capture_io("-2 -3", fn ->
      result = Mars.Reader.get_initial_position
      assert result == {-2,-3}
    end)
  end

  test "initial orientation with north" do
    capture_io("north", fn ->
      result = Mars.Reader.get_initial_orientation
      assert result == :north
    end)
  end

  test "initial orientation with east" do
    capture_io("east", fn ->
      result = Mars.Reader.get_initial_orientation
      assert result == :east
    end)
  end

  test "initial orientation with south" do
    capture_io("south", fn ->
      result = Mars.Reader.get_initial_orientation
      assert result == :south
    end)
  end

  test "initial orientation with west" do
    capture_io("west", fn ->
      result = Mars.Reader.get_initial_orientation
      assert result == :west
    end)
  end
end

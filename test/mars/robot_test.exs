defmodule Mars.RobotTest do
  use ExUnit.Case
  doctest Mars
  import Mars.Robot

  test "series of movements" do
    assert do_actions(robot = %Mars.Robot{position: {0, 0}, orientation: :north}, [:forward, :forward]) == %{robot | position: {0, 2}}
  end

  test "moving forward pointing north" do
    assert do_action(robot = %Mars.Robot{position: {0, 0}, orientation: :north}, :forward) == %{robot | position: {0, 1}}
  end

  test "moving forward pointing east" do
    assert do_action(robot = %Mars.Robot{position: {0, 0}, orientation: :east}, :forward) == %{robot | position: {1, 0}}
  end

  test "moving forward pointing south" do
    assert do_action(robot = %Mars.Robot{position: {0, 0}, orientation: :south}, :forward) == %{robot | position: {0, -1}}
  end

  test "moving forward pointing west" do
    assert do_action(robot = %Mars.Robot{position: {0, 0}, orientation: :west}, :forward) == %{robot | position: {-1, 0}}
  end

  test "moving backward pointing north" do
    assert do_action(robot = %Mars.Robot{position: {0, 0}, orientation: :north}, :backward) == %{robot | position: {0, -1}}
  end

  test "moving backward pointing east" do
    assert do_action(robot = %Mars.Robot{position: {0, 0}, orientation: :east}, :backward) == %{robot | position: {-1, 0}}
  end

  test "moving backward pointing south" do
    assert do_action(robot = %Mars.Robot{position: {0, 0}, orientation: :south}, :backward) == %{robot | position: {0, 1}}
  end

  test "moving backward pointing west" do
    assert do_action(robot = %Mars.Robot{position: {0, 0}, orientation: :west}, :backward) == %{robot | position: {1, 0}}
  end

  test "turning right pointing north" do
    assert do_action(robot = %Mars.Robot{position: {0, 0}, orientation: :north}, :turn_right) == %{robot | orientation: :east}
  end

  test "turning right pointing east" do
    assert do_action(robot = %Mars.Robot{position: {0, 0}, orientation: :east}, :turn_right) == %{robot | orientation: :south}
  end

  test "turning right pointing south" do
    assert do_action(robot = %Mars.Robot{position: {0, 0}, orientation: :south}, :turn_right) == %{robot | orientation: :west}
  end

  test "turning right pointing west" do
    assert do_action(robot = %Mars.Robot{position: {0, 0}, orientation: :west}, :turn_right) == %{robot | orientation: :north}
  end

  test "turning left pointing north" do
    assert do_action(robot = %Mars.Robot{position: {0, 0}, orientation: :north}, :turn_left) == %{robot | orientation: :west}
  end

  test "turning left pointing east" do
    assert do_action(robot = %Mars.Robot{position: {0, 0}, orientation: :east}, :turn_left) == %{robot | orientation: :north}
  end

  test "turning left pointing south" do
    assert do_action(robot = %Mars.Robot{position: {0, 0}, orientation: :south}, :turn_left) == %{robot | orientation: :east}
  end

  test "turning left pointing west" do
    assert do_action(robot = %Mars.Robot{position: {0, 0}, orientation: :west}, :turn_left) == %{robot | orientation: :south}
  end
end

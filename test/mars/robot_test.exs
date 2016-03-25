defmodule Mars.RobotTest do
  use ExUnit.Case
  doctest Mars
  import Mars.Robot

  test "series of movements" do
    assert do_actions(%Mars.Robot{position: {0, 0}, orientation: :north}, [:forward, :forward]) == %Mars.Robot{position: {0, 2}, orientation: :north}
  end

  test "moving forward pointing north" do
    assert do_action(%Mars.Robot{position: {0, 0}, orientation: :north}, :forward) == %Mars.Robot{position: {0, 1}, orientation: :north}
  end

  test "moving forward pointing east" do
    assert do_action(%Mars.Robot{position: {0, 0}, orientation: :east}, :forward) == %Mars.Robot{position: {1, 0}, orientation: :east}
  end

  test "moving forward pointing south" do
    assert do_action(%Mars.Robot{position: {0, 0}, orientation: :south}, :forward) == %Mars.Robot{position: {0, -1}, orientation: :south}
  end

  test "moving forward pointing west" do
    assert do_action(%Mars.Robot{position: {0, 0}, orientation: :west}, :forward) == %Mars.Robot{position: {-1, 0}, orientation: :west}
  end

  test "moving backward pointing north" do
    assert do_action(%Mars.Robot{position: {0, 0}, orientation: :north}, :backward) == %Mars.Robot{position: {0, -1}, orientation: :north}
  end

  test "moving backward pointing east" do
    assert do_action(%Mars.Robot{position: {0, 0}, orientation: :east}, :backward) == %Mars.Robot{position: {-1, 0}, orientation: :east}
  end

  test "moving backward pointing south" do
    assert do_action(%Mars.Robot{position: {0, 0}, orientation: :south}, :backward) == %Mars.Robot{position: {0, 1}, orientation: :south}
  end

  test "moving backward pointing west" do
    assert do_action(%Mars.Robot{position: {0, 0}, orientation: :west}, :backward) == %Mars.Robot{position: {1, 0}, orientation: :west}
  end

  test "turning right pointing north" do
    assert do_action(%Mars.Robot{position: {0, 0}, orientation: :north}, :turn_right) == %Mars.Robot{position: {0, 0}, orientation: :east}
  end

  test "turning right pointing east" do
    assert do_action(%Mars.Robot{position: {0, 0}, orientation: :east}, :turn_right) == %Mars.Robot{position: {0, 0}, orientation: :south}
  end

  test "turning right pointing south" do
    assert do_action(%Mars.Robot{position: {0, 0}, orientation: :south}, :turn_right) == %Mars.Robot{position: {0, 0}, orientation: :west}
  end

  test "turning right pointing west" do
    assert do_action(%Mars.Robot{position: {0, 0}, orientation: :west}, :turn_right) == %Mars.Robot{position: {0, 0}, orientation: :north}
  end
# asddas
  test "turning left pointing north" do
    assert do_action(%Mars.Robot{position: {0, 0}, orientation: :north}, :turn_left) == %Mars.Robot{position: {0, 0}, orientation: :west}
  end

  test "turning left pointing east" do
    assert do_action(%Mars.Robot{position: {0, 0}, orientation: :east}, :turn_left) == %Mars.Robot{position: {0, 0}, orientation: :north}
  end

  test "turning left pointing south" do
    assert do_action(%Mars.Robot{position: {0, 0}, orientation: :south}, :turn_left) == %Mars.Robot{position: {0, 0}, orientation: :east}
  end

  test "turning left pointing west" do
    assert do_action(%Mars.Robot{position: {0, 0}, orientation: :west}, :turn_left) == %Mars.Robot{position: {0, 0}, orientation: :south}
  end
end

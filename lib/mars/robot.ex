defmodule Mars.Robot do
  @moduledoc """
  This module has a Mars Rover Robot that takes a list of actions (movements or
  turns), and returns the new state of the robot
  """
  alias Mars.Robot
  @type action :: atom
  @type position :: {number, number}
  @type orientation :: atom
  defstruct orientation: :north, position: {1, 1}

  @doc """
  Takes a robot (with a position and a orientation) and a list of
  actions and returns a new robot with a new position and/or orientation
  """

  @spec do_actions(%Robot{}, [action]) :: %Robot{}

  def do_actions(robot = %Robot{}, []) do
    robot
  end

  def do_actions(robot = %Robot{}, [first_action | rest]) do
    do_action(robot, first_action)
    |> do_actions(rest)
  end

  @doc """
  Takes a robot and a do_action and returns a new robot with a new position
  and/or orientation

  ##Examples

    iex> Mars.do_action(%Robot{orientation: :north, position: {2, 4}}, :forward)
    %Robot{orientation: north, position: {2, 5}}
  """

  @spec do_action(%Robot{}, action) :: %Robot{}

  #Move forward
  def do_action(robot = %Robot{orientation: :north, position: {x, y}}, :forward), do: %{robot | position: move_square({x, y}, :up)}
  def do_action(robot = %Robot{orientation: :east, position: {x, y}}, :forward), do: %{robot | position: move_square({x, y}, :right)}
  def do_action(robot = %Robot{orientation: :south, position: {x, y}}, :forward), do: %{robot | position: move_square({x, y}, :down)}
  def do_action(robot = %Robot{orientation: :west, position: {x, y}}, :forward), do: %{robot | position: move_square({x, y}, :left)}

  # Moving backward
  def do_action(robot = %Robot{orientation: :north, position: {x, y}}, :backward), do: %{robot | position: move_square({x, y}, :down)}
  def do_action(robot = %Robot{orientation: :east, position: {x, y}}, :backward), do: %{robot | position: move_square({x, y}, :left)}
  def do_action(robot = %Robot{orientation: :south, position: {x, y}}, :backward), do: %{robot | position: move_square({x, y}, :up)}
  def do_action(robot = %Robot{orientation: :west, position: {x, y}}, :backward), do: %{robot | position: move_square({x, y}, :right)}

  # Turning right
  def do_action(robot = %Robot{orientation: :north}, :turn_right), do: %{robot | orientation: :east}
  def do_action(robot = %Robot{orientation: :east}, :turn_right), do: %{robot | orientation: :south}
  def do_action(robot = %Robot{orientation: :south}, :turn_right), do: %{robot | orientation: :west}
  def do_action(robot = %Robot{orientation: :west}, :turn_right), do: %{robot | orientation: :north}

  # Turning left
  def do_action(robot = %Robot{orientation: :north}, :turn_left), do: %{robot | orientation: :west}
  def do_action(robot = %Robot{orientation: :east}, :turn_left), do: %{robot | orientation: :north}
  def do_action(robot = %Robot{orientation: :south}, :turn_left), do: %{robot | orientation: :east}
  def do_action(robot = %Robot{orientation: :west}, :turn_left), do: %{robot | orientation: :south}

  defp move_square({x, y}, :up), do: {x, y + 1}
  defp move_square({x, y}, :down), do: {x, y - 1}
  defp move_square({x, y}, :right), do: {x + 1, y}
  defp move_square({x, y}, :left), do: {x - 1, y}
end

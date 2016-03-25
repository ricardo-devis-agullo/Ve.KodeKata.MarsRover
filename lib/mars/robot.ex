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

  def do_actions(%Robot{position: {x, y}, orientation: orientation}, []) do
    %Robot{orientation: orientation, position: {x, y}}
  end

  def do_actions(%Robot{orientation: orientation, position: {x, y}}, [first_action | rest]) do
    do_action(%Robot{orientation: orientation, position: {x, y}}, first_action)
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
  def do_action(%Robot{orientation: :north, position: {x, y}}, :forward), do: %Robot{orientation: :north, position: move_square({x, y}, :up)}
  def do_action(%Robot{orientation: :east, position: {x, y}}, :forward), do: %Robot{orientation: :east, position: move_square({x, y}, :right)}
  def do_action(%Robot{orientation: :south, position: {x, y}}, :forward), do: %Robot{orientation: :south, position: move_square({x, y}, :down)}
  def do_action(%Robot{orientation: :west, position: {x, y}}, :forward), do: %Robot{orientation: :west, position: move_square({x, y}, :left)}

  # Moving backward
  def do_action(%Robot{orientation: :north, position: {x, y}}, :backward), do: %Robot{orientation: :north, position: move_square({x, y}, :down)}
  def do_action(%Robot{orientation: :east, position: {x, y}}, :backward), do: %Robot{orientation: :east, position: move_square({x, y}, :left)}
  def do_action(%Robot{orientation: :south, position: {x, y}}, :backward), do: %Robot{orientation: :south, position: move_square({x, y}, :up)}
  def do_action(%Robot{orientation: :west, position: {x, y}}, :backward), do: %Robot{orientation: :west, position: move_square({x, y}, :right)}

  # Turning right
  def do_action(%Robot{orientation: :north, position: {x, y}}, :turn_right), do: %Robot{orientation: :east, position: {x, y}}
  def do_action(%Robot{orientation: :east, position: {x, y}}, :turn_right), do: %Robot{orientation: :south, position: {x, y}}
  def do_action(%Robot{orientation: :south, position: {x, y}}, :turn_right), do: %Robot{orientation: :west, position: {x, y}}
  def do_action(%Robot{orientation: :west, position: {x, y}}, :turn_right), do: %Robot{orientation: :north, position: {x, y}}

  # Turning left
  def do_action(%Robot{orientation: :north, position: {x, y}}, :turn_left), do: %Robot{orientation: :west, position: {x, y}}
  def do_action(%Robot{orientation: :east, position: {x, y}}, :turn_left), do: %Robot{orientation: :north, position: {x, y}}
  def do_action(%Robot{orientation: :south, position: {x, y}}, :turn_left), do: %Robot{orientation: :east, position: {x, y}}
  def do_action(%Robot{orientation: :west, position: {x, y}}, :turn_left), do: %Robot{orientation: :south, position: {x, y}}

  defp move_square({x, y}, :up), do: {x, y + 1}
  defp move_square({x, y}, :down), do: {x, y - 1}
  defp move_square({x, y}, :right), do: {x + 1, y}
  defp move_square({x, y}, :left), do: {x - 1, y}
end

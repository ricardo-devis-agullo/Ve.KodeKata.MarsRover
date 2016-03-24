defmodule Mars.Reader do

  @spec get_robot :: %Mars.Robot{}
  def get_robot do
    # size = get_grid_size
    position = get_initial_position
    orientation = get_initial_orientation
    %Mars.Robot{orientation: orientation, position: position}
  end

  @spec get_grid_size :: {number, number}
  def get_grid_size do
    size = IO.gets "Grid size: "
    convert_to_tuple(size, ",")
  end

  @spec get_initial_position :: {number, number}
  def get_initial_position do
    position = IO.gets "Initial position: "
    compute_position(position)
  end

  @spec get_initial_orientation :: atom
  def get_initial_orientation do
    orientation = IO.gets "Initial orientation (north, east, south or west): "
    orientation
    |> String.rstrip
    |> compute_orientation
  end

  defp compute_orientation(orientation) do
    case convert_orientation(orientation) do
      :error ->
        IO.puts("The orientation is not valid.")
        get_initial_orientation
      _ ->
        convert_orientation(orientation)
    end
  end

  defp compute_position(position) do
    if valid_position?(position) do
      convert_to_tuple(position, ",")
    else
      IO.puts("The format is not valid.")
      get_initial_position
    end
  end

  defp valid_position?(position) do
    Regex.match?(~r/-?\d+\s*,\s*-?\d+/, position)
  end

  defp convert_orientation("north"), do: :north
  defp convert_orientation("east"), do: :east
  defp convert_orientation("south"), do: :south
  defp convert_orientation("west"), do: :west
  defp convert_orientation(_other_word), do: :error

  defp convert_to_tuple(input, separator) do
    input
    |> String.rstrip
    |> String.split(separator)
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple
  end
end

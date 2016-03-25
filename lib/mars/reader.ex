defmodule Mars.Reader do
  @type point :: {number, number}
  @type dimensions :: {number, number}
  @type orientation :: atom

  @spec get_robot :: %Mars.Robot{}
  def get_robot do
    position = get_initial_position
    orientation = get_initial_orientation
    %Mars.Robot{orientation: orientation, position: position}
  end

  @spec get_grid_size :: dimensions
  def get_grid_size do
    size = IO.gets "Grid size: "
    compute_grid_size(size)
  end

  @spec get_initial_position :: point
  def get_initial_position do
    position = IO.gets "Initial position: "
    compute_position(position)
  end

  @spec get_initial_orientation :: orientation
  def get_initial_orientation do
    orientation = IO.gets "Initial orientation (N, E, S or W): "
    orientation
    |> String.rstrip
    |> compute_orientation
  end

  def get_command do
    command = IO.gets "Select command (f, b, r or l): "
    command
    |> String.rstrip
    |> compute_command
  end

  defp compute_command(command) do
    case convert_command(command) do
      :error ->
        IO.puts("The command is not valid.")
        get_command
      _ ->
        convert_command(command)
    end
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
    if valid_numbers?(position) do
      convert_to_tuple(position)
    else
      IO.puts("The format is not valid.")
      get_initial_position
    end
  end

  defp compute_grid_size(size) do
    if valid_numbers?(size) do
      convert_to_tuple(size)
    else
      IO.puts("The format is not valid.")
      get_grid_size
    end
  end

  defp valid_numbers?(position) do
    Regex.match?(~r/-?\d+\s+-?\d+/, position)
  end

  defp convert_orientation("N"), do: :north
  defp convert_orientation("E"), do: :east
  defp convert_orientation("S"), do: :south
  defp convert_orientation("W"), do: :west
  defp convert_orientation(_other_word), do: :error

  defp convert_command("f"), do: :forward
  defp convert_command("b"), do: :backward
  defp convert_command("r"), do: :turn_right
  defp convert_command("l"), do: :turn_left
  defp convert_command(_other_word), do: :error

  defp convert_to_tuple(input, separator \\ " ") do
    input
    |> String.rstrip
    |> String.split(separator)
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple
  end
end

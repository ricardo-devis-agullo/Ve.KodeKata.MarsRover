defmodule Mars do
  alias Mars.{Grid, Reader, Robot}

  def main(_args) do
    {w, h} = Reader.get_grid_size
    grid = Grid.new({w, h})
    robot = Reader.get_robot
    command = Reader.get_command
    Robot.do_action(robot, command)
  end
end

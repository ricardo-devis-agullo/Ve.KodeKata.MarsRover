defmodule Mars.Grid do
  def new({x,y}) do
    Agent.start_link(fn -> {x, y} end)
  end

  def get(grid) do
    Agent.get(grid, fn({x, y}) -> {x, y} end)
  end
end

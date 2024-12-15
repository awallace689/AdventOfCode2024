alias AdventOfCode2024.Day3
alias AdventOfCode2024.AOCFile

defmodule Day3 do
  def expr_regex(), do: ~r/mul\((?<x>\d{1,3}),(?<y>\d{1,3})\)/

  defmodule Part1 do
    def solution() do
      AOCFile.read_file_by_line!(3, 1)
      |> get_input_value()
    end

    def get_input_value(lines) do
      Enum.reduce(lines, 0, fn line, total_value ->
        line_value = get_line_value(line)

        total_value + line_value
      end)
    end

    def get_line_value(line) do
      Regex.scan(Day3.expr_regex(), line, capture: ["x", "y"])
      |> Enum.reduce(0, fn [x_str, y_str], line_value ->
        [x, y] = [String.to_integer(x_str), String.to_integer(y_str)]
        line_value + x * y
      end)
    end
  end
end

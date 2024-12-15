alias AdventOfCode2024.Day2
alias AdventOfCode2024.AOCFile

defmodule Day2 do
  def parse_input_reports() do
    lines = AOCFile.read_file_by_line!(2, 1)

    Enum.reduce(lines, [], fn line, reports ->
      report =
        line
        |> String.trim()
        |> String.split(" ")
        |> Enum.map(&String.to_integer/1)

      [report | reports]
    end)
    |> Enum.reverse()
  end

  def in_safe_range?(x, y) do
    diff = abs(y - x)

    0 < diff and diff < 4
  end

  defmodule Part1 do
    def solution() do
      Day2.parse_input_reports()
      |> Enum.filter(&is_safe?/1)
      |> Enum.count()
    end

    def is_safe?(report) do
      case report do
        [] ->
          true

        [_ | []] ->
          true

        [x, next | _] ->
          is_safe_rec(report, x < next, true)
      end
    end

    defp is_safe_rec(report, increasing?, safe?) do
      case {report, safe?} do
        {_, false} ->
          false

        {[], _} ->
          safe?

        {[_ | []], _} ->
          safe?

        {[x, next | xs], _} ->
          is_safe_rec(
            [next | xs],
            increasing?,
            if(increasing?,
              do: next > x and Day2.in_safe_range?(x, next),
              else: next < x and Day2.in_safe_range?(x, next)
            )
          )
      end
    end
  end

  defmodule Part2 do
    def solution() do
      Day2.parse_input_reports()
      |> Enum.filter(&is_safe?/1)
      |> Enum.count()
    end

    def is_safe?(report) do
      case report do
        [] ->
          true

        [_ | []] ->
          true

        [x, next | xs] ->
          is_safe_rec(report, x < next, true, false) or
            is_safe_rec([next | xs], next < List.first(xs), true, true) or
            is_safe_rec([x | xs], x < List.first(xs), true, true)
      end
    end

    defp is_safe_rec(report, increasing?, safe?, retried?) do
      case {report, safe?} do
        {_, false} ->
          false

        {[], _} ->
          safe?

        {[_ | []], _} ->
          safe?

        {[x, next | xs], _} ->
          passed_check? =
            if increasing? do
              next > x and Day2.in_safe_range?(x, next)
            else
              next < x and Day2.in_safe_range?(x, next)
            end

          if retried? or (not retried? && passed_check?) do
            is_safe_rec([next | xs], increasing?, passed_check?, retried?)
          else
            is_safe_rec([x | xs], increasing?, true, true)
          end
      end
    end
  end
end

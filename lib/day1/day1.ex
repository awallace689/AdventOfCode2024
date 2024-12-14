alias AdventOfCode2024.Day1
alias AdventOfCode2024.AOCFile

defmodule Day1 do
  def parse_input_lists() do
    lines = AOCFile.read_file_by_line!(1, 1)

    # use hashmap instead for O(n)
    Enum.reduce(lines, [[], []], fn line, [list_a, list_b] ->
      [num_a, num_b] = line |> String.trim() |> String.split("   ")
      list_a = [String.to_integer(num_a) | list_a]
      list_b = [String.to_integer(num_b) | list_b]

      [list_a, list_b]
    end)
  end

  defmodule Part1 do
    def solution() do
      Day1.parse_input_lists()
      |> Enum.map(&Enum.sort(&1))
      |> calculate_locations_diff()
    end

    def calculate_locations_diff([list_a, list_b]) do
      Enum.zip_reduce([list_a, list_b], 0, fn [num_a, num_b], total_diff ->
        total_diff + abs(num_b - num_a)
      end)
    end
  end

  defmodule Part2 do
    def solution() do
      Day1.parse_input_lists()
      |> Enum.map(&Enum.sort(&1))
      |> count_occurrences_in_right()
      |> calc_similarity_score()
    end

    def count_occurrences_in_right([left, right]) do
      init_left_keys =
        left
        |> Enum.reduce(%{}, &Map.put(&2, &1, 0))

      right
      |> Enum.reduce(init_left_keys, fn num, occurrences ->
        if Map.has_key?(occurrences, num) do
          Map.update!(occurrences, num, &(&1 + 1))
        else
          occurrences
        end
      end)
    end

    def calc_similarity_score(occurrences) do
      Map.keys(occurrences)
      |> Enum.reduce(0, &(&2 + &1 * Map.get(occurrences, &1, 0)))
    end
  end
end

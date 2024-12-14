alias AdventOfCode2024.Day1
alias AdventOfCode2024.Day2

defmodule AdventOfCode2024Test do
  defmodule Day1Test do
    use ExUnit.Case
    doctest AdventOfCode2024.Day1

    test "P1" do
      assert Day1.Part1.solution() === 2_000_468
    end

    test "P2" do
      assert Day1.Part2.solution() === 18_567_089
    end
  end

  defmodule Day2Test do
    use ExUnit.Case
    doctest AdventOfCode2024.Day2

    test "P1" do
      assert Day2.Part1.solution() === 524
    end

    test "P2" do
      assert Day2.Part2.solution() === 569
    end
  end
end

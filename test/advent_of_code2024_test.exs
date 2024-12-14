alias AdventOfCode2024.Day1

defmodule AdventOfCode2024Test do
  use ExUnit.Case
  doctest AdventOfCode2024

  test "Day1 P1" do
    assert Day1.Part1.solution() === 2_000_468
  end

  test "Day1 P2" do
    assert Day1.Part2.solution() === 18_567_089
  end
end

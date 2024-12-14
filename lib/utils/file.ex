defmodule AdventOfCode2024.AOCFile do
  @doc """
  Reads (day, part) input file line by line.

  ## Params
  - day: 1-31
  - part: 1-2
  """
  @spec read_file_by_line!(Integer.t(), Integer.t()) :: Enumerable.t()
  def read_file_by_line!(day, part)
      when 1 <= day and day <= 31 and (1 <= part and part <= 2) do
    priv_dir = :code.priv_dir(:advent_of_code_2024)
    file_path = Path.join(priv_dir, "/data/day#{day}_p#{part}.txt")

    if File.exists?(file_path) do
      File.stream!(file_path)
    else
      raise "File '${file_path}' not found."
    end
  end
end

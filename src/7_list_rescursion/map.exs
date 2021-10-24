defmodule MyList do
  def mapsum([], _), do: 0
  def mapsum([head | tail], func), do: func.(head) + mapsum(tail, func)

  def max([head | tail]), do: _max(tail, head)
  defp _max([], comp_value), do: comp_value
  defp _max([head | tail], comp_value) when head >= comp_value, do: _max(tail, head)
  defp _max([head | tail], comp_value) when head < comp_value, do: _max(tail, comp_value)
end

# 練習問題1
ans1 = MyList.mapsum([1, 2, 3], &(&1 * &1))
IO.puts(ans1)

# 練習問題2
ans2 = MyList.max([1, 7, 8, 8, 10])
IO.puts(ans2)

# 練習問題3わからない・・・何を返したら良いのか仕様もよくわからん・・・悔しく

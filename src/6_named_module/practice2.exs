defmodule Recursion do
  # 練習問題4
  def sum(0), do: 0
  def sum(n), do: n + sum(n - 1)
  # 練習問題5
  def gcd(_, 0), do: 0
  def gcd(x, y), do: gcd(y, rem(x, y))
end

defmodule Chop do
  def get_central_value(min..max) when min >= 1 and max <= 1000 do
    div(min + max, 2)
  end

  def guess(actual, min..max) do
    guess_value = get_central_value(min..max)
    IO.puts("Is it #{guess_value}")
    recursion_if_needed(actual, guess_value, min..max)
  end

  def recursion_if_needed(actual, guess, _) when actual == guess, do: IO.puts(guess)

  def recursion_if_needed(actual, guess, min.._) when actual < guess,
    do: guess(actual, min..guess)

  def recursion_if_needed(actual, guess, _..max) when actual > guess,
    do: guess(actual, guess..max)
end

Chop.guess(273, 1..1000)

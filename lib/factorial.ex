defmodule Factorial do
  @behaviour Runnable
  def run, do: 5 |> recAcc() |> IO.puts()

  @doc """
  This case is only using function head because of the multiple cases.

  Even with this, I can also use it this way:
  def join(a, b, sep \\ " ") do
    a <> sep <> b
  end

  Is nothing wrong putting name in there, my personal preference is
  putting only the name of important values when using default arguments
  """
  def recAcc(_, acc \\ 1)

  def recAcc(0, acc), do: acc
  def recAcc(number, acc), do: recAcc(number - 1, number * acc)

  def rec(0), do: 1

  def rec(number) when number > 0 do
    number * rec(number - 1)
  end
end

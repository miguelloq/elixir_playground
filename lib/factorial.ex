defmodule Factorial do
  @behaviour Runnable
  def run, do: 5 |> recAcc() |> IO.puts()

  def recAcc(number), do: recAcc(number, 1)
  def recAcc(0, acc), do: acc
  def recAcc(number, acc), do: recAcc(number - 1, number * acc)

  def rec(0), do: 1

  def rec(number) when number > 0 do
    number * rec(number - 1)
  end
end

defmodule ConcurrencyPlayground do
  @behaviour Runnable
  def run do
    pid = spawn(__MODULE__, :squareConcurrency, [])
    send(pid, {:ok, self(), {2, 3}})

    receive do
      {:ok, number} -> IO.puts(number)
    end
  end

  def squareConcurrency do
    square = &(&1 * &2)
    receive do
      {:ok, sender, {num1, num2}} -> send(sender, {:ok, square.(num1, num2)})
    end

    squareConcurrency()
  end
end

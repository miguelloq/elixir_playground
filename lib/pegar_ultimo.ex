defmodule PegarUltimo do
  @behaviour Runnable
  def run() do
    run(10_000)
  end

  def run(listSize) do
    list = Enum.to_list(1..listSize)

    {last, rest} = PegarUltimo.pegar2(list)

    IO.puts("Último: #{last}")
    IO.inspect(rest)
  end

  def pegar([head | []]), do: {head, []}

  def pegar([head | tail]) do
    {ultimo, resto} = pegar(tail)
    {ultimo, [head | resto]}
  end

  def pegar2(list) when is_list(list) do
    pegar2(list, [])
  end

  def pegar2([head | []], list) when is_list(list) do
    {head, Enum.reverse(list)}
  end

  def pegar2([head | tail], list) when is_list(list) do
    pegar2(tail, [head | list])
  end
end

defmodule PegarUltimo.Concurrency do
  @behaviour Runnable
  def run() do
    pidQuantity = 10000

    pidList =
      for _ <- 1..pidQuantity, do: spawn(__MODULE__, :pegarUltimoConcurrency, [])

    Enum.each(pidList, fn pid -> send(pid, :ok) end)
  end

  def pegarUltimoConcurrency() do
    receive do
      :ok -> PegarUltimo.run()
    end

    pegarUltimoConcurrency()
  end
end

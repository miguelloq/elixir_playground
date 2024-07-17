defmodule Runnable do
  @callback run() :: :ok
end

defmodule Main do
  @behaviour Runnable
  def run do
    PegarUltimo.Concurrency.run()
  end
end

Main.run()

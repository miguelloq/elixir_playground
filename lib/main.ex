defmodule Runnable do
  @callback run() :: :ok
end

defmodule Main do
  @behaviour Runnable
  def run do
    :ok
  end
end

Main.run()

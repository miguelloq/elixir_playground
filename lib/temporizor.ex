defmodule Temporizor do
  def measureFunc(func) when is_function(func,0) do
    {time,result}=measureFunc2(func)
    {time,result}
  end

  #defp measureFunc1(func), do: :timer.tc(func,:seconds )

  defp measureFunc2(func) do
    start_time = System.monotonic_time()
    result = func
    end_time = System.monotonic_time()
    time = System.convert_time_unit(end_time - start_time,:native, :second)
    {time, result}
  end
end

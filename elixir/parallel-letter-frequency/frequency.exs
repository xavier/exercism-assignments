defmodule Frequency do
  @doc """
  Count word frequency in parallel.

  Returns a dict of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t], pos_integer) :: Dict.t
  def frequency(texts, workers) do
    pids = create_workers(workers)
    distribute_work(texts, pids)
    result = aggregate_counters(collect_results(texts))
    terminate_workers(pids)
    result
  end

  defp create_workers(workers) do
    Enum.map(1..workers, &start_letter_counter_process/1)
  end

  defp terminate_workers(pids) do
    Enum.each(pids, fn (pid) -> send pid, :stop end)
  end

  defp distribute_work(texts, pids) do
    workers = length(pids)
    Stream.with_index(texts) |> Enum.each(fn ({text, index}) ->
      send Enum.at(pids, rem(index, workers)), {:count_letters, text}
    end)
  end

  defp collect_results(texts) do
    Enum.map(texts, fn (_) ->
      receive do
        result -> result
      end
    end)
  end

  defp start_letter_counter_process(_worker) do
    parent = self()
    spawn(fn -> letter_counter_process(parent) end)
  end

  defp letter_counter_process(parent) do
    receive do
      {:count_letters, text} ->
        send(parent, count_letters(text))
        letter_counter_process(parent)
      :stop ->
    end
  end

  defp aggregate_counters([]), do: %{}
  defp aggregate_counters(counters) do
    Enum.reduce(counters, &merge_counters/2)
  end

  defp merge_counters(counters1, counters2) do
    Dict.merge(counters1, counters2, fn (_, c1, c2) -> c1 + c2 end)
  end

  defp count_letters(text) do
    Enum.reduce(
      String.graphemes(sanitize(text)),
      %{},
      &update_letter_counters/2
    )
  end

  defp update_letter_counters(letter, counters) do
    Dict.update(counters, letter, 1, &(&1 + 1))
  end

  @rejected_characters ~r/[\s\d,-]/

  defp sanitize(text) do
    Regex.replace(@rejected_characters, text, "") |> String.downcase
  end

end

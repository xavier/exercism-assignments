defmodule BankAccount do
  @moduledoc """
  A bank account that supports access from multiple processes.
  """

  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  @doc """
  Open the bank. Makes the account available.
  """
  @spec open_bank() :: account
  def open_bank() do
    spawn(fn () -> bank_account_process(0) end)
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: none
  def close_bank(account) do
    send account, {self(), :close}
  end

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  def balance(account) do
    send account, {self(), :balance}
    receive do
      {^account, :ok, account_balance} -> account_balance
    end
  end

  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any
  def update(account, amount) do
    send account, {self(), :update, amount}
  end

  defp bank_account_process(current_balance) do
    receive do
      {sender, :balance} ->
        send sender, {self(), :ok, current_balance}
        bank_account_process(current_balance)
      {_sender, :update, amount} ->
        bank_account_process(current_balance + amount)
      {_sender, :close} ->
    end
  end

end
